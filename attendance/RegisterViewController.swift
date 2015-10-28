//
//  RegisterViewController.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/26/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var profFirstname: UITextField!
    @IBOutlet weak var profLastname: UITextField!
    @IBOutlet weak var profEmail: UITextField!
    @IBOutlet weak var profPassword: UITextField!

    let userRole = "User Role"
    let userDefaults = NSUserDefaults.standardUserDefaults()

    var alertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // End editing mode when touch out of Text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }


    // Submit Professor registration
    @IBAction func registerProfessorPressed(sender: AnyObject) {

        if let role = userDefaults.stringForKey(userRole)
        {
            print("User Role: \(role)")
        }

        // display alert, show user imputs ##TODO
        
        let alertController = UIAlertController(title: "Appcoda", message: "Message in alert dialog", preferredStyle: UIAlertControllerStyle.Alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: {(alert :UIAlertAction!) in
            print("Delete button tapped")
        })
        alertController.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alert :UIAlertAction!) in
            print("OK button tapped")
        })
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
//        alertController = UIAlertController(
//            title: "Register User",
//            message:  "Some text",
//            preferredStyle: .Alert)
//        
//        let firstAction = UIAlertAction(title: "OK",
//            style: .Cancel,
//            handler: { (action: UIAlertAction!) in
//                print("Handle Ok logic here")
//        })
//        
//        let secondAction = UIAlertAction(title: "Cancel",
//            style: .Default,
//            handler: {(action:UIAlertAction!) in
//                print("Handle Cancel Logic here")
//        })
//        
//        alertController!.addAction(firstAction)
//        alertController!.addAction(secondAction)
//        
//        
//        presentViewController(alertController!, animated: true, completion: nil)

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

