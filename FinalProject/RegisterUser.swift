//
//  RegisterUser.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import Foundation

class RegisterUser {
    
    static var instance: RegisterUser = RegisterUser()
    
    var user: User?
    
    func changeUser (user: User) {
        self.user = user
    }
    
    func changePassword (password: String) {
        self.user?.password = password
    }

}
