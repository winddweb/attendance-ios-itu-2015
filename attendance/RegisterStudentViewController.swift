//
//  RegisterStudentViewController.swift
//  attendance
//
//  Created by Yifeng on 11/8/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit
import DBAlertController

class RegisterStudentViewController: UIViewController {
    
    var userToRegister: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let message = "User Current value: \(userToRegister)"
        
        let alertController = DBAlertController(title: "Attendance", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        alertController.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
