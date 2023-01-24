//
//  LoginViewController.swift
//  Homework.2.4
//
//  Created by Карина Чадаева on 17.01.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        welcomeVC.user = user
        aboutUserVC.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed() {
        guard
            userNameTextField.text == user.login,
                passwordTextField.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "showAcc", sender: nil)
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Ooops!", message: "Your name is \(user.login) 😉")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Ooops!", message: "Your password is \(user.password) 😉")
    }
    
}


//MARK: Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true 
    }
}

