//
//  DashViewController.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/17/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // check uer role
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userRole = "User Role"
        print("User Role (can be nil for first time user)")
        print(userDefaults.stringForKey(userRole))
//        if userDefaults.objectForKey(userRole) == nil { // production
        if userDefaults.objectForKey(userRole) == nil || userDefaults.objectForKey(userRole) != nil  { // development
            
            print("show loginVC")
            
            // Load Login screen ##TODO
            
//            if let loginController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC") as? LoginViewController {
//                
//                self.navigationController?.presentViewController(loginController, animated: true, completion: nil)
//                
//            }
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // in a tab view, viewDidLoad will only fire once
    // viewWillAppear will be fired every time view shows
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // self.navigationController?.navigationBarHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDashboard(segue: UIStoryboardSegue) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
