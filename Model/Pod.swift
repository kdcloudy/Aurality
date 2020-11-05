//
//  Pod.swift
//  Aurality
//
//  Created by Ashwin Chandrasekar on 29/10/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import Foundation

struct response: Decodable {
    var Info:PodInfo
}

struct PodInfo: Decodable {
    var title:String
    var podcast:Publisher
}

struct Publisher: Decodable {
    var publisher:String
}
