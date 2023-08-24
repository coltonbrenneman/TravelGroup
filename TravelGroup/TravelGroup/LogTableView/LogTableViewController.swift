//
//  DiaryTableViewController.swift
//  TravelGroup
//
//  Created by Briana Bayne on 8/16/23.
//

import UIKit

class LogTableViewController: UITableViewController {

    // MARK: - LifeCycles
    
    // ViewDidLoad will only happen when the app launches for the first time.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//ViewDidLoad
    // We are adding view will appear + tableview reload data becasue the viewdid load only runs when the app launches and we need the tableview to reload our data once we have created a log. This action happens when the app is still open meaning that viewDidLoad wont trigger again.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }//ViewWillAppear
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // This is number of Rows in section on the tableview. We want to return as many logs that the user creates. So we are calling the logs that are created and adding the count. That will populate the number of rows we need.
        return LogController.shared.logs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brianaIsAmazing", for: indexPath) // This identifer is for the cell.
        // This is configuring the information in the cell on the tableview. The information is created in the cell then displayed on the tableview.
        let log = LogController.shared.logs[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = log.logTitle
        config.secondaryText = log.logDate.asString() // using the date helper here to use as a string
        cell.contentConfiguration = config
    
        return cell
    }
// Using this function to delete the cell on the tableview.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // creating a constant named log and assigning the value adding that log into the delete.
            let log = LogController.shared.logs[indexPath.row]
            LogController.shared.delete(log: log)
            tableView.deleteRows(at: [indexPath], with: .fade) // deleting the indexPath of that log.
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // the segue is what connects two storyboards together, we are giving an identifer of toDetailVC
        if segue.identifier == "toDetailVC" {
            if let indexPath = tableView.indexPathForSelectedRow { // if indexpath = for that selected row
                if let destination = segue.destination as? LogDetailViewController { // let the destination be the LogDetailController that is our detail scree.
                    let log = LogController.shared.logs[indexPath.row]
                    destination.log = log // destination log
                }
            }
        }
    }
 

}
