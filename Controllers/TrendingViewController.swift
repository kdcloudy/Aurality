//
//  TrendingViewController.swift
//  Aurality
//
//  Created by Kaustubh Debnath on 08/11/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCell", for: indexPath) as! TrendingViewCell;
        
        let section1 = sections[indexPath.row]
        cell.setItems(title: section1["title"]!, subtitle: section1["pub"]!);

        return cell
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TrendingToSection", sender: "self")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrendingToSection" {
            let destVC = segue.destination as! PodViewController
            let ipp = (tableView.indexPathForSelectedRow?.row)!
            print(ipp)
            let section = sections[ipp]
            destVC.section = section
            destVC.itemPath = ipp
        }

    }



   
}
