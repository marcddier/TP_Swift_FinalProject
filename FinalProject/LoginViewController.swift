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
            signInView.warning.text = "Please register first"
            return
        }
        
        if email != RegisterUser.instance.user?.email || password != RegisterUser.instance.user?.password {
            print("Unable to find a match with this pair of email / password")
            signInView.warning.text = "Unable to find a match with this pair of email / password"
            return
        }
        
        profilView.myEmail.text = email
        print("Successful login")
        signInView.warning.text = ""
        
        signInView.isHidden = true
        profilView.isHidden = false
    }
    
    func toSignUp() {
        signInView.isHidden = true
        signUpView.isHidden = false
        
        signInView.warning.text = ""
    }
    
    func signUp() {
        
        let email: String = signUpView.email.text!
        if email == ""{
            print("email is nil")
            signUpView.warning.text = "email is empty"
            return
        }
        if !isValidEmail(testStr: email) {
            print("email is not valid")
            signUpView.warning.text = "email is not valid"
            return
        }
        
        let password: String = signUpView.password.text!
        if password == "" {
            print("password is nil")
            signUpView.warning.text = "password is empty"
            return
        }
        if !isValidPassword(password: password) {
            print("invalid password, 4 character at least")
            signUpView.warning.text = "invalid password, 4 character at least"
            return
        }
        
        
        let confPassword: String = signUpView.confirmPassword.text!
        if confPassword == ""{
            print("confirm password is nil")
            signUpView.warning.text = "password confirmation is empty"
            return
        }
        
        if confPassword != password {
            print("Passwords are not matching")
            signUpView.warning.text = "Passwords are not matching"
            return
        }
        
        let newUser = User(email: email, password: password)
        
        RegisterUser.instance.changeUser(user: newUser)
        
        print("Successful sign up")
        signUpView.warning.text = ""

        signUpView.isHidden = true
        signInView.isHidden = false
        
    }
    
    func toSignIn() {
        signUpView.isHidden = true
        signInView.isHidden = false
        
        signUpView.warning.text = ""
    }
    
    func changePassword() {
        let password: String = profilView.newPassword.text!
        if !isValidPassword(password: password) {
            print("invalid password, 4 character at least")
            profilView.warning.text = "invalid password, 4 character at least"
            return
        }
        if password == ""{
            print("password is nil")
            profilView.warning.text = "password is empty"
            return
        }
        let confPassword: String = profilView.confNewPassword.text!
        if confPassword == ""{
            print("confirm password is nil")
            profilView.warning.text = "password confirmation is empty"
            return
        }
        
        if confPassword != password {
            print("Passwords are not matching")
            profilView.warning.text = "Passwords are not matching"
            return
        }
        
        RegisterUser.instance.changePassword(password: password)
        print("Password change is a success")
        profilView.warning.text = "Password change is a success"
    }
    
    func logout() {
        profilView.isHidden = true
        signInView.isHidden = false

        profilView.warning.text = ""
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passRegEx = "[A-Z0-9a-z._%+-]{4,64}"
        
        let passTest = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: password)
    }
}
