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

        // Do any additional setup after loading the view.
    }
    // MARK: - Properties
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
 
    
    // MARK: - Functions
}
