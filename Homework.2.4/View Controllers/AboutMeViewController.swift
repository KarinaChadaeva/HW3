//
//  AboutMeViewController.swift
//  Homework.2.4
//
//  Created by Карина Чадаева on 23.01.23.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
    

}
