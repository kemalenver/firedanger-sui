//
//  Configuration.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 8/9/2023.
//

import Foundation

struct Configuration {
    static let fireDangerXMLURL = URL(string: "https://www.rfs.nsw.gov.au/feeds/fdrToban.xml")!
    static let fireDangerRatingURL = "https://www.rfs.nsw.gov.au/plan-and-prepare/fire-danger-ratings"
    static let rulesURL = "https://www.rfs.nsw.gov.au/fire-information/fdr-and-tobans/total-fire-ban-rules"
    static let advertWidth: CGFloat = 320
    static private let releaseBannerID = "ca-app-pub-3940256099942544/2435281174"
    static private let debugBannerID = "ca-app-pub-3940256099942544/2435281174"
    
    static func bannerID() -> String {
    #if DEBUG
        return Configuration.debugBannerID
    #else
        return Configuration.releaseBannerID
    #endif
    }
}
