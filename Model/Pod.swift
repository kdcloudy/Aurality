//
//  Pod.swift
//  Aurality
//
//  Created by Ashwin Chandrasekar on 29/10/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import Foundation

class PodData: Decodable{
    var title: String
    
    init(title: String){
        self.title = title
    }
}
