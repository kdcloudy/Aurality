//
//  TopHitViewController.swift
//  Aurality
//
//  Created by Kaustubh Debnath on 08/11/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class TopHitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    let topHits = ["The Joe Rogan Experience", "Interlerks Podcazt", "The Overthink Tank", "TED Talks Daily","Mission ISRO with Harsha Bhogle", "RED FM 93.5", "Simple Ken - Hosted by Kenny Sebastian", "Dr. Death Season 2"]
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topHits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopHitsCell", for: indexPath)
        cell.textLabel?.text = topHits[indexPath.row]
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    

}
