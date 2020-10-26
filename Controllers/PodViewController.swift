//
//  PodViewController.swift
//  UICollectTest
//
//  Created by Kaustubh Debnath on 29/09/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit
import AVKit

class PodViewController: UIViewController {

    @IBOutlet weak var PodArt: UIImageView!
    @IBOutlet weak var PodLabel: UILabel!
    var section: [String: String]!
    @IBOutlet weak var pubLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var podDesc: UITextView!
    
    var itemPath = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        PodLabel.text = section["title"]
        PodArt.image = UIImage(named: section["image"]!)
        pubLabel.text = section["pub"]
        podDesc.text = section["desc"]
        title = section["title"]
        //print("from screen2", itemPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PodToPlay" {
            let destVC2 = segue.destination as! PlayViewController
            section = sections[itemPath]
            destVC2.section = section
            }
    }

    
    
    @IBAction func playPressed(_ sender: Any) {
        if(section["type"]=="audio"){
            performSegue(withIdentifier: "PodToPlay", sender: playButton)
        } else {
//            let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
//            let url = URL(string: urlString)
//            let player = AVPlayer(url: url!)
//            let playerController = AVPlayerViewController()
//            playerController.player = player
//            present(playerController, animated: true) {
//                player.play()
//            }
            let filename = section["file"]
            let videoPath = Bundle.main.path(forResource: filename, ofType: "mp4")
            let videoPathURL = URL(fileURLWithPath: videoPath!)

            let player = AVPlayer(url: videoPathURL)
            let playerController = AVPlayerViewController()
            playerController.player = player
            present(playerController, animated: true) {
                player.play()
            }
        }
        
        
    }
}
   



