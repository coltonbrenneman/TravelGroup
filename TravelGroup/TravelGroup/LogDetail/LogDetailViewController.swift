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
    // Pulling over the outlets for the detail screen.
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // calling updateUI
        updateUI()
    }
    // MARK: - Properties
    var log: Log?
    // creating a property to use when we need from our Model.
    
    // MARK: - Actions
    // This action is saving our title, address and body once it is created.
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
        // Will pop the view like a stack of pancakes.
        navigationController?.popViewController(animated: true)
    }// SaveButtonTapped
    
    // MARK: - Functions
    // Creating a function updateUI
    func updateUI() {
        logDateLabel.text = Date().asString() // using our date helper to create a string instead of an INT
        guard let log = log else { return }
        logDateLabel.text = log.logDate.asString()
        logTitleTextField.text = log.logTitle // taking the label text field.text and giving it a log. logTitle
        logAddressTextField.text = log.logAddress
        logBodyTextView.text = log.logBody
        
    }// UpdateUI

    
}// End of Class
