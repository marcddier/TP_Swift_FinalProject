//
//  User.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import Foundation

class User {
    var email: String 
    var password: String
    
    init(email: String, password: String) {
        self .email = email
        self .password = password
    }
}
