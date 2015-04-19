//
//  ProfileViewController.swift
//  What's that word?
//
//  Created by AJ Ibraheem on 19/04/2015.
//  Copyright (c) 2015 The Leaf Enterprise. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageView: PFImageView!
    
    let user = PFUser.currentUser()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width/2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //Get the profile Image
        let imageFile = self.user["profilePicture"] as! PFFile
        imageFile.getDataInBackgroundWithBlock { (imageData:NSData?, error:NSError?) -> Void in
            if error == nil {
                let image = UIImage( data: imageData )
                self.profileImageView.image = image
            }else{
                //if failed, just fail silently my dear, life is too short to complain😩😪
            }
        }
    }

    @IBAction func profileImageTouched(sender: AnyObject) {
        selectImageFromLibrary()
    }
    
    func selectImageFromLibrary(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = true
        self.presentViewController(picker, animated: true, completion: nil)
    }
    @IBAction func unwindFromSegue( segue:UIStoryboardSegue ){
        //unwind from the previous segue
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.profileImageView.image = image
        let imageData = UIImagePNGRepresentation(image)
        let imageFile = PFFile( name: "profilePicture.png", data: imageData )
        self.user["profilePicture"] = imageFile
        self.user!.saveInBackgroundWithBlock() { (success:Bool, error:NSError?) -> Void in
            if success {
                //Do nothing for now
            }else{
                self.profileImageView.image = UIImage( named: "user_male4-128.png" )
                let alert = UIAlertController(title: "Error", message: "Could not save image, please check internet connection", preferredStyle: .Alert)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
