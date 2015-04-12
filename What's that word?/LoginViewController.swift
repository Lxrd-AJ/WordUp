//
//  LoginViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 25/03/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit

class LoginViewController: PFLogInViewController {

    required init(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        //Customizations UI
        self.fields = ( PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton
                        | PFLogInFields.PasswordForgotten | PFLogInFields.Twitter )
        let logInButtonColor = UIColor( red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0 )
        self.logInView?.logInButton?.setTitleColor( logInButtonColor, forState: .Normal)
        self.logInView?.passwordForgottenButton?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UILabel( frame: CGRectMake( 100, 100, 200, 100) )
        logo.font = UIFont( name: "HelveticaNeue-Light", size: 25.0 )
        logo.text = "What's that word?"
        self.logInView?.logo = logo
        //adjust the background color rgb(46, 204, 113)
        self.view.backgroundColor = UIColor( red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0 )
    }
    
    override func viewWillAppear(animated: Bool) {
        //customizations
        self.navigationController?.navigationBarHidden = true
        self.delegate = self
        self.signUpController = SignupViewController()
        self.signUpController?.delegate = self
        
        //Test, always log out the user for now, IDGAF
        PFUser.logOut()
    }
    
    override func viewDidAppear(animated: Bool) {
        //check if there is a current user
        if(( PFUser.currentUser() ) != nil){
            showHomeViewController()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //FIXME: The logInButton's background color isnt changing
        self.logInView?.logInButton?.backgroundColor = UIColor( red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0 )
    }
    
    func showHomeViewController() {
        self.performSegueWithIdentifier("homeSegue", sender: self)
    }
}

extension LoginViewController: PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        logInController.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("homeSegue", sender: self)
    }
}

extension LoginViewController: PFSignUpViewControllerDelegate {
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        signUpController.dismissViewControllerAnimated(true, completion: nil)
        showHomeViewController()
    }
}
