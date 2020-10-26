//
//  PlayViewController.swift
//  UICollectTest
//
//  Created by Kaustubh Debnath on 30/09/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit
import AVFoundation


class PlayViewController: UIViewController {
    var section: [String: String]!
    var player: AVAudioPlayer?
    
    @IBOutlet weak var podLabel: UILabel!
    @IBOutlet weak var podArt: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        podArt.image = UIImage(named: section["image"]!)
        podLabel.text = section["title"]
        let filename = section["file"]
        let urlString = Bundle.main.path(forResource: filename, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch{
            print("Something went wrong")
        }
    }
    

    @IBAction func playPressed(_ sender: Any) {
        if let player = player, player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        } else {
            player?.play()
             playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
        
    }
  
}
