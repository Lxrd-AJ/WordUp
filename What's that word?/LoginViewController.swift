//
//  LoginViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 25/03/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit

class LoginViewController: PFLogInViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UILabel( frame: CGRectMake( 100, 100, 200, 100) )
        logo.font = UIFont( name: "HelveticaNeue-Light", size: 25.0 )
        logo.text = "What's that word?"
        self.logInView?.logo = logo
        
        //adjust the background color rgb(46, 204, 113)
        self.view.backgroundColor = UIColor( red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0 )
        self.logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal )
        self.logInView?.logInButton?.backgroundColor = UIColor.whiteColor()
        //TODO: loginButton not changing background color
        //self.logInView?.logInButton?.setTitleColor( UIColor.blueColor(), forState: .Normal)
        self.logInView?.logInButton?.layer.backgroundColor = UIColor.whiteColor().CGColor
    }
}
