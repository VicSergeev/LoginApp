//
//  ViewController.swift
//  LoginApp
//
//  Created by Vic on 27.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: User login and password
    private let userLogin = "User"
    private let userPass = "1111"
    
    // MARK: Setup segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userNameValue = "\(userNameTextField.text ?? "")!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
         view.addGestureRecognizer(tapGesture)
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
    
    // MARK: Action buttons
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if passwordTextField.text != userPass || userNameTextField.text != userLogin {
            showAlert(
                withTitle: "Login or passowrd is incorrect!",
                andMessage: "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func forgotUserAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is User🤔")
    }
    
    @IBAction func forgotPassAction() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is Password🤫")
    }
    
    
}

