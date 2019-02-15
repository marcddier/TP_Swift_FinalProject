//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate, ProfilViewDelegate {
    
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var profilView: ProfilView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInView.delegate = self
        signUpView.delegate = self
        profilView.delegate = self
        
    }



    func signIn() {
        
        let email: String = signInView.email.text!
        let password: String = signInView.password.text!
        
        if RegisterUser.instance.user == nil {
            print("Please register first")
            return
        }
        
        if email != RegisterUser.instance.user?.email || password != RegisterUser.instance.user?.password {
            print("Unable to find a match with this pair of email / password")
            return
        }
        
        profilView.myEmail.text = email
        print("Successful login")
        
        signInView.isHidden = true
        profilView.isHidden = false
    }
    
    func toSignUp() {
        signInView.isHidden = true
        signUpView.isHidden = false
    }
    
    func signUp() {
        
        let email: String = signUpView.email.text!
        if email == ""{
            print("email is nil")
            return
        }
        let password: String = signUpView.password.text!
        if password == ""{
            print("password is nil")
            return
        }
        let confPassword: String = signUpView.confirmPassword.text!
        if confPassword == ""{
            print("confirm password is nil")
            return
        }
        
        if confPassword != password {
            print("Passwords are not matching")
            return
        }
        
        let newUser = User(email: email, password: password)
        
        RegisterUser.instance.changeUser(user: newUser)
        
        print("Successful sign up")

        signUpView.isHidden = true
        signInView.isHidden = false
        
    }
    
    func toSignIn() {
        signUpView.isHidden = true
        signInView.isHidden = false
        
    }
    
    func changePassword() {
        let password: String = profilView.newPassword.text!
        if password == ""{
            print("password is nil")
            warningLabel.text = "password is empty"
            return
        }
        let confPassword: String = profilView.confNewPassword.text!
        if confPassword == ""{
            print("confirm password is nil")
            warningLabel.text = "confirm password is empty"
            return
        }
        
        if confPassword != password {
            print("Passwords are not matching")
            warningLabel.text = "Passwords are not matching"
            return
        }
        
        RegisterUser.instance.changePassword(password: password)
        print("Password change is a success")
    }
    
    func logout() {
        profilView.isHidden = true
        signInView.isHidden = false

    }
}
