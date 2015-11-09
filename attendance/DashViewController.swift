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

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        // check uer role
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userRole = "User Role"
        
        print("User Role (nil for first time user)")
        print(userDefaults.stringForKey(userRole))

        if userDefaults.objectForKey(userRole) == nil { // production
            print("should show login")
            performSegueWithIdentifier("showLogin", sender: self)
        }
    }
    
    @IBAction func resetLoginPressed(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userRole = "User Role"
        
        userDefaults.removeObjectForKey(userRole)
        print("reset user role to ", userDefaults.stringForKey(userRole))
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
    @IBAction func testButtonPressed(sender: AnyObject) {
        
        tabBarController?.selectedIndex = 1
        
        
//        // Disable a tabbar item
//        var tabbarTest: UITabBarItem = UITabBarItem()
//        
//        let tabBarControllerItems = self.tabBarController?.tabBar.items
//        if let arrayOfTabBarItems = tabBarControllerItems as! AnyObject as? NSArray{
//            
//            tabbarTest = arrayOfTabBarItems[3] as! UITabBarItem
//            tabbarTest.enabled = false
//            
//        }
        
        // remove a tabbar item
        // viewControllers property is an array of all tabbar items
        // remove the index from that array
        // TODO: Find out which tabs are for students, and which are for professors.
        if let tabBarController = self.tabBarController {
            let indexToRemove = 3
            if indexToRemove < tabBarController.viewControllers?.count {
                var viewControllers = tabBarController.viewControllers
                viewControllers?.removeAtIndex(indexToRemove)
                tabBarController.viewControllers = viewControllers
            }
        }
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
