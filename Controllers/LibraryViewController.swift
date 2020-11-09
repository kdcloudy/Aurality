//
//  LibraryViewController.swift
//  Aurality
//
//  Created by Kaustubh Debnath on 08/11/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var bro2 = ["The Joe Rogan Experience", "The Ben Shapiro Show", "WVFRM"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibCell", for: indexPath)
        cell.textLabel?.text = favdata[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            //self.tableView.deleteRows(at: [indexPath], with: .automatic)
            favdata.remove(at: indexPath.row)
            self.tableView.reloadData()
            completion(true)
        }
        
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "trash")
        
        
        return action
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    


}
