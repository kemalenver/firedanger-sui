//
//  firedanger_suiApp.swift
//  Shared
//
//  Created by Kemal Enver on 1/1/2022.
//

import SwiftUI
import GoogleMobileAds


@main
struct firedanger_suiApp: App {
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
