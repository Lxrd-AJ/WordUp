//
//  MenuViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 13/04/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let transitionManager = MenuTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        self.transitioningDelegate = transitionManager
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func showProfile(sender: AnyObject) {
//        let storyboard = UIStoryboard()
//        let vc = storyboard.instantiateViewControllerWithIdentifier("profileViewController") as! ProfileViewController
//        self.performSegueWithIdentifier("showProfile", sender: self)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
