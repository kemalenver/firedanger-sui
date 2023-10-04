//
//  ContentView.swift
//  Shared
//
//  Created by Kemal Enver on 1/1/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var manager = LocationObserver()
    
    var body: some View {

        switch manager.appState {
        case .checkingLocation:
            FindingLocationView()
        case .userLocationNotFound:
            LocationNotFoundView()
        case .locationPermissionDenied:
            LocationDeniedView()
        case .requestingLocationPermission:
            RequestLocationView()
        case .fetchingFireDangerData:
            FindingLocationView()
        case .ready:
            MainView(manager: manager)
        case .regionNotSupported:
            UnsupportedLocationView()
        case .noFireDangerData:
            NoDataErrorView()
        }
    }
}

struct MainView: View {
    
    @ObservedObject var manager: LocationObserver

    @State private var tabSelection = 0

    var todayButtonTint: Color {
        return tabSelection == 0 ? manager.todayForecastModel!.tintColor() : manager.tomorrowForecastModel!.tintColor()
    }
    
    var tomorrowButtonTint: Color {
        return tabSelection == 1 ? manager.tomorrowForecastModel!.tintColor() : manager.todayForecastModel!.tintColor()
    }
    
    var todayUnderLineTont: Color {
        return tabSelection == 0 ? todayButtonTint : .clear
    }
    
    var tomorrowUnderLineTont: Color {
        return tabSelection == 1 ? tomorrowButtonTint : .clear
    }
    
    var body: some View {
        
        ZStack(alignment:.top) {
            
            GeometryReader { geometry in
                
                HStack(alignment: .center, spacing: 0) {
                    VStack {
                        Button("today") {
                            tabSelection = 0
                        }
                        .frame(width: geometry.size.width / 2, height: 50)
                        .background(Color.clear)
                        .foregroundColor(todayButtonTint)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(todayUnderLineTont)
                            .padding(0)
                    }
                    
                    VStack {
                        Button("tomorrow") {
                            tabSelection = 1
                        }
                        .frame(width: geometry.size.width / 2, height: 50)
                        .foregroundColor(tomorrowButtonTint)
                        .background(Color.clear)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(tomorrowUnderLineTont)
                            .padding(0)
                    }
                }
            }
            .frame(height: 50)
            .zIndex(1)
            
            TabView(selection: $tabSelection) {
                FireDataView(forecastModel: self.manager.todayForecastModel!).tag(0)
                FireDataView(forecastModel: self.manager.tomorrowForecastModel!).tag(1)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
