//
//  TopPods.swift
//  Aurality
//
//  Created by Kaustubh Debnath on 08/11/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class TopPods: UITableViewCell {

    @IBOutlet weak var PodTitle: UILabel!
    
    
    func setTitle(title: String){
        PodTitle.text = title;
    }

}
