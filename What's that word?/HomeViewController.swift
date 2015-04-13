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
    
    let transitionManager = MenuTransitionManager()
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        
        leftBarButton.image = UIImage(named: "menu-100")
        leftBarButton.imageInsets = UIEdgeInsetsMake(35,0, 35, 60)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem( title: "Search", style: .Plain, target: nil, action: nil )
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
    
    func showMenu(){
        self.performSegueWithIdentifier("showMenu", sender: self);
    }
    
    @IBAction func unwindFromSegue( segue:UIStoryboardSegue ){
        //unwind from the previous segue
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
