//
//  DiaryTableViewController.swift
//  TravelGroup
//
//  Created by Briana Bayne on 8/16/23.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//ViewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }//ViewWillAppear
    
    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return LogController.shared.logs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brianaIsAmazing", for: indexPath)
            
        let log = LogController.shared.logs[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = log.logTitle
        config.secondaryText = log.logDate.asString()
        cell.contentConfiguration = config
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dairy = LogController.shared.logs[indexPath.row]
            LogController.shared.delete(log: dairy)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? LogDetailViewController {
                    let dairy = LogController.shared.logs[indexPath.row]
                    destination.log = dairy
                }
            }
        }
    }
 

}
