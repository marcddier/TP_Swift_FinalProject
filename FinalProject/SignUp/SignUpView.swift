//
//  SignUpView.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var delegate: SignUpViewDelegate?
    
    override init (frame: CGRect) { // for using customView in code
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using cutomView in IB
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    func initSubviews() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
    
    @IBAction func SignUpAction () {
        delegate?.signUp()
    }
    
    @IBAction func LoginAction () {
        delegate?.toSignIn()
    }
}
