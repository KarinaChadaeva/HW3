//
//  User.swift
//  Homework.2.4
//
//  Created by Карина Чадаева on 17.01.23.
//

import Foundation

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getUserData() -> User {
        User(login: "User",
             password: "Password",
             person: Person(name: "Karina",
                            surname: "Chadaeva")
        )
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
