//
//  WelcomeViewController.swift
//  Homework.2.4
//
//  Created by Карина Чадаева on 17.01.23.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user.login)!"

    }
    

}
