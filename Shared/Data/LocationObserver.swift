//
//  LocationObserver.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 5/1/2023.
//

import MapKit
import CoreLocation
import SwiftyXMLCoding

enum FindRegionError: Error {
    case notFound
    case badRenderer
}

enum AppState {
    case fetchingFireDangerData
    case requestingLocationPermission
    case locationPermissionDenied
    case checkingLocation
    case userLocationNotFound
    case regionNotSupported
    case noFireDangerData
    case ready
}

class LocationObserver: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    private static let fireDangerURL = URL(string: "https://www.rfs.nsw.gov.au/feeds/fdrToban.xml")!
    
    @Published var selectedRegion = "NA"
    @Published var appState: AppState = .fetchingFireDangerData
    
    private let manager = CLLocationManager()
    
    private var lastLocation = CLLocation() {
        didSet {
            regionChanged()
        }
    }
    
    private var geoJsonFeatures: [MKGeoJSONFeature] = []
    
    private var properties: [Properties] = []
    
    var fireBanInfo: FireDangerMap? {
        didSet {
            self.manager.startUpdatingLocation()
        }
    }
    
    var todayForecastModel: NSWForecastModel?
    var tomorrowForecastModel: NSWForecastModel?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        loadRegionData()
        Task { await loadDangerData() }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.appState = .checkingLocation
        
        guard let location = locations.last else {
            return
        }
        
        self.lastLocation = location
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if (manager.authorizationStatus == .authorizedWhenInUse) || (manager.authorizationStatus == .authorizedAlways) {
            appState = .checkingLocation
            manager.requestLocation()
        } else if manager.authorizationStatus == .notDetermined {
            appState = .requestingLocationPermission
            manager.requestWhenInUseAuthorization()
        } else if manager.authorizationStatus == .denied {
            appState = .locationPermissionDenied
        } 
//        else {
//            appState = .userLocationNotFound
//            manager.requestWhenInUseAuthorization()
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location failed: \((error as NSError).description)")
//        appState = .userLocationNotFound
    }
}

extension LocationObserver {
    
    private func loadRegionData() {
        guard let url = Bundle.main.url(forResource: "regions", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let geoJSON = try MKGeoJSONDecoder().decode(data)
            
            geoJsonFeatures = geoJSON.compactMap { $0 as? MKGeoJSONFeature }
            self.properties = self.geoJsonFeatures.compactMap { self.convertToProperties(data: $0.properties) }
        } catch {
            appState = .noFireDangerData
            print("error:\(error)")
        }
    }
    
    private func convertToProperties(data: Data?) -> Properties? {
        guard let data = data else { return nil }
        return try? JSONDecoder().decode(Properties.self, from: data)
    }
    
    @MainActor
    private func loadDangerData() async {
        let request = URLRequest(url: LocationObserver.fireDangerURL)
        let result = try? await URLSession.shared.data(for: request)

        guard let data = result?.0 else { return }

        let fireBanInfo = try? XMLDecoder().decode(FireDangerMap.self, from: data)
        self.fireBanInfo = fireBanInfo
    }
}

extension LocationObserver {
    
    private func regionChanged() {
        
        selectedRegion = "\(lastLocation.coordinate)"
        
        guard let fireBanInfo else {
            appState = .fetchingFireDangerData
            return
        }

        do {
            let properties = try findRegion()

            let matchingDistrict = fireBanInfo.District.filter { (district) -> Bool in
                return Int(district.RegionNumber.trimmingCharacters(in: .whitespacesAndNewlines)) == properties.DIST_NO
            }

            guard let district = matchingDistrict.first else {
                throw FindRegionError.notFound
            }

            todayForecastModel = NSWForecastModel(locationProperties: properties, district: district, day: .today)
            tomorrowForecastModel = NSWForecastModel(locationProperties: properties, district: district, day: .tomorrow)

            selectedRegion = district.Name
            appState = .ready
        } catch {
            selectedRegion = "Unsupported region"
            appState = .regionNotSupported
        }
    }
    
    private func findRegion() throws -> Properties {
        
        for geoJSONObject in self.geoJsonFeatures {
            
            guard let properties = self.convertToProperties(data: geoJSONObject.properties) else {
                continue
            }
            
            let userLocation = self.lastLocation.coordinate
            let mapPoint: MKMapPoint = MKMapPoint(userLocation)
            
            let polygon = geoJSONObject.geometry[0]
            let renderer: MKOverlayPathRenderer
            
            switch polygon {
            case let object as MKMultiPolygon:
                renderer = MKMultiPolygonRenderer(multiPolygon: object)
            case let object as MKPolygon:
                renderer = MKPolygonRenderer(polygon: object)
            default:
                fatalError("Should have had a renderer")
            }
            
            let polygonViewPoint: CGPoint = renderer.point(for: mapPoint)
            if renderer.path.contains(polygonViewPoint) {
                return properties
            }
        }

        throw FindRegionError.notFound
    }
}
