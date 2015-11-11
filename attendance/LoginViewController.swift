//
//  LoginViewController.swift
//  Attendance Tracker
//
//  Created by Yifeng on 10/17/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit
import DBAlertController
import SwiftValidator

class LoginViewController: UIViewController , ValidationDelegate {

    // TextFields
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!

    // Error Labels
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    
    let orange = UIColor(red:1.00, green:0.45, blue:0.01, alpha:1.0)
    let greenL1 = UIColor(red:0.58, green:0.75, blue:0.49, alpha:1.0)

    
    let validator = Validator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.hidden = true
            validationRule.errorLabel?.text = ""
            validationRule.textField.layer.borderColor = self.greenL1.CGColor
            validationRule.textField.layer.borderWidth = 0.5
            
            }, error:{ (validationError) -> Void in
                print("error")
                validationError.errorLabel?.hidden = false
                validationError.errorLabel?.text = validationError.errorMessage
                validationError.textField.layer.borderColor = self.orange.CGColor
                validationError.textField.layer.borderWidth = 0.5
        })
        
        errorEmailLabel.hidden = true
        errorPasswordLabel.hidden = true
        
        
        // register validators
        // TODO: implement custom email validation rule
        validator.registerField(loginEmailTextField, errorLabel: errorEmailLabel, rules: [RequiredRule(), EmailRule(message: "Invalid email")])
        validator.registerField(loginPasswordTextField, errorLabel: errorPasswordLabel, rules: [RequiredRule(), MinLengthRule(length: 7)])
        
        
        // dismiss keyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "hideKeyboard"))
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
        
        validator.validate(self)
        
    }
    
    func validationSuccessful() {
        // submit the form
        displayLoginInfo()
    }
    
    func validationFailed(errors:[UITextField:ValidationError]) {
        // turn the fields to red
        for (field, error) in validator.errors {
            field.layer.borderColor = UIColor.redColor().CGColor
            field.layer.borderWidth = 1.0
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.hidden = false
        }
    }
    
    func displayLoginInfo() {
        
        view.endEditing(true)
        
        let message = loginEmailTextField.text! + "\n" + loginPasswordTextField.text!
        
        let alertController = DBAlertController(title: "Attendance", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            
            // set user flag
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let keyIsNewUser = "New User"
            
            userDefaults.setObject( NSDate(), forKey: keyIsNewUser )
            
            self.performSegueWithIdentifier("loginSuccess", sender: self)
            
        }))
        alertController.show()
    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
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
