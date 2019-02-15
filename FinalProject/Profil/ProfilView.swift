//
//  ProfilView.swift
//  FinalProject
//
//  Created by Marc DIDIER on 14/02/2019.
//  Copyright © 2019 Marc DIDIER. All rights reserved.
//

import UIKit

class ProfilView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var myEmail: UILabel!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confNewPassword: UITextField!
    
    var delegate: ProfilViewDelegate?
    
    override init (frame: CGRect) { // for using customView in code
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using cutomView in IB
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    func initSubviews() {
        Bundle.main.loadNibNamed("ProfilView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
    
    @IBAction func changePassword() {
        delegate?.changePassword()
    }
    @IBAction func logout() {
        delegate?.logout()
    }
    

}
