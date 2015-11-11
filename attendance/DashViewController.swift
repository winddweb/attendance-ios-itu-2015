//
//  DashViewController.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/17/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let keyUserRole = "User Role"
    let keyIsNewUser = "New User"

    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)

        // check uer role
        
        print("## User Role")
        print(userDefaults.stringForKey(keyUserRole))

        if userDefaults.objectForKey(keyIsNewUser) == nil { // production
            // show login
            performSegueWithIdentifier("showLogin", sender: self)
        }
    }
    
    // in a tab view, viewDidLoad will only fire once
    // viewWillAppear will be fired every time view shows
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        upadateUserInfo()
        // self.navigationController?.navigationBarHidden = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func resetLoginPressed(sender: AnyObject) {
        // reset isNewUser flag
        userDefaults.removeObjectForKey(keyIsNewUser)
        userDefaults.removeObjectForKey(keyUserRole)
        print("## Reset user role to ", userDefaults.stringForKey(keyUserRole))
        performSegueWithIdentifier("showLogin", sender: self)
    }
    
    @IBAction func goToLastPressed(sender: AnyObject) {
        var numberOfTabs: Int = 0
        
        if let tabBarController = self.tabBarController {
            numberOfTabs = (tabBarController.viewControllers?.count)!
        }

        tabBarController?.selectedIndex = numberOfTabs - 1
        
    }
    
    @IBAction func removeTabPressed(sender: AnyObject) {
        
        /// ## remove a tabbar item
        /// - viewControllers property is an array of all tabbar items
        /// - remove the index from that array
        /// TODO: Find out which tabs are for students, and which are for professors.
        if let tabBarController = self.tabBarController {
            let indexToRemove = (tabBarController.viewControllers?.count)! - 1
            if indexToRemove < tabBarController.viewControllers?.count && indexToRemove > 0 {
                var viewControllers = tabBarController.viewControllers
                viewControllers?.removeAtIndex(indexToRemove)
                tabBarController.viewControllers = viewControllers
            }
        }

        
    }
    
    func upadateUserInfo() {
        
        // num1 < num2 ? DO SOMETHING IF TRUE : DO SOMETHING IF FALSE
        
        nameLabel.text = "John Doe"
        
        roleLabel.text = userDefaults.objectForKey(keyUserRole) != nil ? userDefaults.stringForKey(keyUserRole) : "Error"
        
        genderLabel.text = "Myth"
        
        
        if let date = userDefaults.objectForKey(keyIsNewUser) as? NSDate {
            dateLabel.text = date.stringFromDate(date, format: "MMM d, yyyy H:mm a")
        } else {
            dateLabel.text = "Error"
        }
        
    }
    
    @IBAction func unwindToDashboard(segue: UIStoryboardSegue) {
        
    }
    
    
    func disablesTab() {
        
        // Disable a tabbar item
        var tabbarTest: UITabBarItem = UITabBarItem()
        
        let tabBarControllerItems = self.tabBarController?.tabBar.items
        if let arrayOfTabBarItems = tabBarControllerItems as! AnyObject as? NSArray{
            
            tabbarTest = arrayOfTabBarItems[3] as! UITabBarItem
            tabbarTest.enabled = false
            
        }
        
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
