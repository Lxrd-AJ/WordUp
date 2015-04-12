//
//  SingupViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 25/03/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit

class SignupViewController: PFSignUpViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UILabel( frame: CGRectMake( 100, 100, 200, 100) )
        logo.font = UIFont( name: "HelveticaNeue-Light", size: 25.0 )
        logo.text = "What's that word?"
        
        self.signUpView?.logo = logo
    }

    
}
