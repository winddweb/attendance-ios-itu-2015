//
//  LoginViewController.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/17/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit
import DBAlertController

class LoginViewController: UIViewController {

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    
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
    
    @IBAction func loginSignInPressed(sender: AnyObject) {
        
        // check user input is empty
        if loginEmailTextField.text!.isEmpty || loginPasswordTextField.text!.isEmpty
        {
            let message = "Email or password could not be empty"
            
            let alertController = DBAlertController(title: "Attendance", message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            alertController.show()
        } else {
            displayLoginInfo()
        }
        
    }
    
    func displayLoginInfo() {
        
        view.endEditing(true)
        
        let message = loginEmailTextField.text! + "\n" + loginPasswordTextField.text!
        
        let alertController = DBAlertController(title: "Attendance", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        alertController.show()
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
