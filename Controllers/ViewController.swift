//
//  ViewController.swift
//  UICollectTest
//
//  Created by Kaustubh Debnath on 29/09/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var testCarousel: UICollectionView!
    @IBOutlet var tableView: UITableView!
    var podRequest = PodRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testCarousel.delegate = self
        testCarousel.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
            
            let section = sections[indexPath.row]
            cell.textLabel?.text = section["title"]
            
            return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
    }
}
    
    
    


