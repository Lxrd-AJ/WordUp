//
//  ViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 25/03/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //customizations
        self.navigationController?.navigationBarHidden = true
        
        //Test, always log out the user for now, IDGAF
        PFUser.logOut()
    }
    
    override func viewDidAppear(animated: Bool) {
        //check if there is a current user
        if(( PFUser.currentUser() ) != nil){
            showHomeViewController()
        }else{
            //present the user with a login view controller
            signUpLogInUser()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginClicked(sender: AnyObject) {
        signUpLogInUser()
    }
    
    func signUpLogInUser(){
        //create the signup view controller
        let logInController = LoginViewController()
        logInController.delegate = self
        logInController.signUpController = SignupViewController()
        logInController.signUpController?.delegate = self
        self.presentViewController(logInController, animated: true, completion: nil)
    }
    
    func showHomeViewController() {
        self.performSegueWithIdentifier("homeSegue", sender: self)
    }
}

extension ViewController: PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        logInController.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("homeSegue", sender: self)
    }
}

//TODO: Fix bug here
extension ViewController: PFSignUpViewControllerDelegate {
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        signUpController.dismissViewControllerAnimated(true, completion: nil)
        showHomeViewController()
    }
}