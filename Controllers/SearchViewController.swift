//
//  SearchViewController.swift
//  UICollectTest
//
//  Created by Kaustubh Debnath on 29/09/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    

    let data = ["The Joe Rogan Experience", "The Overthink Tank", "TED Talks Daily","Mission ISRO with Harsha Bhogle", "Simple Ken", "Dr. Death Season 2", "WVFRM", "Office Ladies", "Gaurav Kapur | Honestly with Tanmay Bhat #3", "The Guitar Podcast", "The Vergecast", "Mostly Nitpicking", "Lew Later","Bhuvan Bam | Honestly with Tanmay Bhat #5", "RITVIZ | Honestly with Tanmay Bhat #6", "Sunrisers beat the odds and injuries to make IPL playoffs", "A bit of needle, a bit of spice as Suryakumar makes a statement", "CSK still searching for their spark", "The Present and The Future for the 49ers and Packers", "Story of my Friend's 1960 Gibson J-50"  ]
    var filteredData: [String]!
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResult", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "searchToSection", sender: self)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = addAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [add])
    }
    
    func addAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Add to Library") { (action, view, completion) in
            
            //var ipp = (self.tableView.indexPathForSelectedRow)!
            let cell = self.tableView.cellForRow(at: indexPath)
            let query = cell?.textLabel?.text
            favdata.append(query!)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "plus")
        return action
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchToSection" {
            let destVC = segue.destination as! PodViewController
            var ipp = (tableView.indexPathForSelectedRow)!
            print(ipp)
            var ipp2 = 0;
            let cell = tableView.cellForRow(at: ipp)
            let query = cell?.textLabel?.text
            print(query!)
            var section: [String: String]!
            
            for (index, data) in sections.enumerated() {
                if data["title"] == query {
                    section = data;
                    ipp2 = index;
                    
                }
            }
            destVC.section = section
            destVC.itemPath = ipp2;
        }

    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        searchBar.delegate = self
        filteredData = data
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        } else {
        for item in data {
            if item.lowercased().contains(searchText.lowercased()){
                filteredData.append(item)
            }
        }
        }
        tableView?.reloadData()
        
    }
    
    
    
    

}
