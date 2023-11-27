//
//  ViewController.swift
//  LoginApp
//
//  Created by Vic on 27.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Preinstalled user login and password
    private let userLogin = "User"
    private let userPass = "1111"
    
    // MARK: Setup segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userNameValue = "\(userNameTextField.text ?? "")!"
    }
    
    // MARK: Check login & pass
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == userLogin, passwordTextField.text == userPass else {
            showAlert(
                withTitle: "Login or passowrd is incorrect!",
                andMessage: "Please, enter correct login and password"
            )
            return false
        }
        return true
    }
    
    // MARK: Setup keyboard hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //MARK: Setup alert
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okayAction = UIAlertAction(title: "OK", style: .default) { [self]_ in
            passwordTextField.text = ""
        }
        alert.addAction(okayAction)
        present(alert, animated: true)
    }
    
    // MARK: Exit segue
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        _ = segue.source as? WelcomeViewController
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: Action buttons show alerts
    
    @IBAction func forgotUserAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is User🤔")
    }
    
    @IBAction func forgotPassAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is Password🤫")
    }
    
    
}
