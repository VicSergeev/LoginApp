//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Vic on 27.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: User outlet
    @IBOutlet var welcomeUserNameLabel: UILabel!
    
    // MARK: User name property
    var userNameValue: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserNameLabel.text = userNameValue
    }

    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
    }
    
}
