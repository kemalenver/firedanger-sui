//
//  FeatureCollection.swift
//  firenofire
//
//  Created by Kemal Enver on 6/2/20.
//  Copyright © 2020 Kemal Enver. All rights reserved.
//

import Foundation

struct Properties: Decodable {
    var DIST_NO: Int
    var DIST_NAME: String
    var AAC: String
    var SOURCE: String
    var GROUP_NAME: String?
    var STATE_CODE: String
}

