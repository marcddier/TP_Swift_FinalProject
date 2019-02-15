//
//  SignInView.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import UIKit

class SignInView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var warning: UILabel!
    
    var delegate: SignInViewDelegate?
    
    override init (frame: CGRect) { // for using customView in code
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using cutomView in IB
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    func initSubviews() {
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
    
    @IBAction func SignInAction () {
        delegate?.signIn()
    }
    
    @IBAction func RegisterAction () {
        delegate?.toSignUp()
    }
}
