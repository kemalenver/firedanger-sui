//
//  BanModel.swift
//  firenofire
//
//  Created by Kemal Enver on 6/2/20.
//  Copyright © 2020 Kemal Enver. All rights reserved.
//

import Foundation
//import XMLCoder

/*
 <?xml version="1.0"?>
 <FireDangerMap>
 <District>
 <Name>Far North Coast</Name>
 <RegionNumber>1</RegionNumber>
 <Councils>Ballina; Byron; Clarence Valley; Kyogle; Lismore; Richmond Valley; Tweed</Councils>
 <DangerLevelToday>LOW MODERATE</DangerLevelToday>
 <DangerLevelTomorrow>None</DangerLevelTomorrow>
 <FireBanToday>No</FireBanToday>
 <FireBanTomorrow>No</FireBanTomorrow>
 </District>
 </FireDangerMap>
 */

struct FireDangerMap: Codable {
    
    var District: [District]
}

struct District: Codable {
    let Name: String
    let RegionNumber: String
    let Councils: String?
    var DangerLevelToday: String?
    var DangerLevelTomorrow: String?
    var FireBanToday: String
    var FireBanTomorrow: String
}

