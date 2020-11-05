//
//  ViewController.swift
//  UICollectTest
//
//  Created by Kaustubh Debnath on 29/09/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var testCarousel: UICollectionView!
    var podRequest = PodRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testCarousel.delegate = self
        testCarousel.dataSource = self
        podRequest.getPodcast()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToSection" {
            let destVC = segue.destination as! PodViewController
            let indexPath = sender as! IndexPath
            let ipp = indexPath.row
            print(indexPath)
            print(ipp)
            let section = sections[ipp]
            destVC.section = section
            destVC.itemPath = ipp
            
        }
    }
}


    
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SectionCollectionViewCell
        
        let section = sections[indexPath.row]
        cell.bgImagePod.image = UIImage(named: section["image"]!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HomeToSection", sender: indexPath)
    }
      

}
    
    
    


