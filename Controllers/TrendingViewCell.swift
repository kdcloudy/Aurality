//
//  TrendingViewCell.swift
//  Aurality
//
//  Created by Kaustubh Debnath on 08/11/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class TrendingViewCell: UITableViewCell {
    
    @IBOutlet weak var PodTitle: UILabel!
    @IBOutlet weak var PodSubtitle: UILabel!
    
    
    func setItems(title: String, subtitle: String){
        
        PodTitle.text = title;
        PodSubtitle.text = subtitle;
    }
    
}
