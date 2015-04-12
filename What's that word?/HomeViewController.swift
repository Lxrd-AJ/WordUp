//
//  HomeViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 25/03/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        println( PFUser.currentUser()?.username )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
