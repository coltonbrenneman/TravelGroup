//
//  LogDetailViewController.swift
//  TravelGroup
//
//  Created by Milo Kvarfordt on 8/16/23.
//

import UIKit

class LogDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var logDateLabel: UILabel!
    @IBOutlet weak var logTitleTextField: UITextField!
    @IBOutlet weak var logAddressTextField: UITextField!
    @IBOutlet weak var logBodyTextView: UITextView!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let logs = loadLogs()
        updateUI()
    }
    // MARK: - Properties
    var log: Log?
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = logTitleTextField.text, !title.isEmpty,
              let address = logAddressTextField.text, !address.isEmpty,
              let body = logBodyTextView.text, !body.isEmpty else { return }
                
        if let log = log {
            // log on line 26 has a value, which means that a user must have selected a cell and sent a log through the segue.
            LogController.shared.update(log: log, title: title, address: address, body: body)
        } else {
            // log on line 26 does NOT have a value, which means the user has tapped on the plus button and is creating a new Diary log!
            LogController.shared.createLog(title: title, address: address, body: body)
        }
        navigationController?.popViewController(animated: true)
    }// SaveButtonTapped
    
    // MARK: - Functions
    func updateUI() {
        logDateLabel.text = Date().asString()
        guard let log = log else { return }
        logDateLabel.text = log.logDate.asString()
        logTitleTextField.text = log.logTitle
        logAddressTextField.text = log.logAddress
        logBodyTextView.text = log.logBody
        
    }// UpdateUI
    func saveLogs(_ logs: [Log]) {
        do {
            let encoder = JSONEncoder()
            let encodedLogs = try encoder.encode(logs)
            UserDefaults.standard.set(encodedLogs, forKey: "logs")
        } catch {
            print("Error encoding and saving logs: \(error)")
        }
    }
    func loadLogs() -> [Log] {
        guard let encodedLogs = UserDefaults.standard.data(forKey: "logs") else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let logs = try decoder.decode([Log].self, from: encodedLogs)
            return logs
        } catch {
            print("Error decoding and loading logs: \(error)")
            return []
        }
    }
}// End of Class

