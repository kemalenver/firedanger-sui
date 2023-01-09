//
//  FireViewModel.swift
//  firenofire
//
//  Created by Kemal Enver on 6/2/20.
//  Copyright © 2020 Kemal Enver. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum Day {
    case today
    case tomorrow
}

enum WarningLevel: String {
    case level0 = "None"
    case level1 = "NO RATING"
    case level2 = "MODERATE"
    case level3 = "HIGH"
    case level4 = "EXTREME"
    case level5 = "CATASTROPHIC"
}

class ForecastModel {
    
    private var warningLevel: WarningLevel {
        
        if self.day == .today {
            guard let dangerLevel = district.DangerLevelToday else {
                return .level0
            }
            return WarningLevel(rawValue: dangerLevel) ?? .level0
        } else {
            guard let dangerLevel = district.DangerLevelTomorrow else {
                return .level0
            }
            return WarningLevel(rawValue: dangerLevel) ?? .level0
        }
    }
    
    private let locationProperties: Properties
    private let district: District
    private let day: Day
    
    init(locationProperties: Properties, district: District, day: Day) {
        
        var district = district
        district.DangerLevelToday = "HIGH"
        district.FireBanToday = "no"
        district.DangerLevelTomorrow = "CATASTROPHIC"
        district.FireBanTomorrow = "yes"
        
        self.locationProperties = locationProperties
        self.district = district
        self.day = day
    }
    
    func backgroundColor() -> Color {
        return dangerLevelToColor(self.warningLevel)
    }
    
    private func dangerLevelToColor(_ dangerLevel: WarningLevel) -> Color {
        switch dangerLevel {
        case .level0: return Color("level0")
        case .level1: return Color("level1")
        case .level2: return Color("level2")
        case .level3: return Color("level3")
        case .level4: return Color("level4")
        case .level5: return Color("level5")
        }
    }
    
    func icon() -> UIImage? {
        if warningLevel == .level0 {
            return UIImage(named: "timelapse")
        } else {
            return UIImage(named: "fire1")
        }
    }
    
    func tintColor() -> Color {
        
        if self.warningLevel == .level0 {
            return Color("loadingTint")
        }
        
        return [WarningLevel.level2, WarningLevel.level5].contains(self.warningLevel) ? Color("lightTint") : Color("darkTint")
    }
    
    func banIconVisible() -> Bool {
       if self.day == .today {
            return district.FireBanToday.lowercased() == "yes"
        } else {
            return district.FireBanTomorrow.lowercased() == "yes"
        }
    }
    
    func fireBanText() -> String {
        if self.day == .today {
            return district.FireBanToday.lowercased() == "no" ? "No fire ban in place" : "Fire ban in place"
        } else {
            if warningLevel == .level0 {
                return "Tomorrow’s ratings are issued each afternoon"
            }
            
            return district.FireBanTomorrow.lowercased() == "no" ? "No fire ban in place" : "Fire ban in place"
        }
    }
    
    func fireDangerText() -> String {
        if self.day == .today {
            return "Fire danger rating: " + (district.DangerLevelToday?.capitalized ?? "Unknown")
        } else {
            if warningLevel == .level0 {
                return "Check back later "
            }
            return "Fire danger rating: " + (district.DangerLevelTomorrow?.capitalized ?? "Unknown")
        }
    }
    
    func locationText() -> String {
        return self.locationProperties.DIST_NAME
    }
    
    func showInfoButton() -> Bool {
        return warningLevel != .level0
    }
}
