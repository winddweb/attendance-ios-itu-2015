//
//  RegisterTableViewController.swift
//  attendance
//
//  Created by Yifeng on 11/7/15.
//  Copyright © 2015 the Pioneers. All rights reserved.
//

import UIKit
import DBAlertController

class RegisterTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var studentProfileImageView: UIImageView!
    @IBOutlet weak var studentFirstNameTextField: UITextField!
    @IBOutlet weak var studentLastNameTextField: UITextField!
    @IBOutlet weak var studentGenderSegment: UISegmentedControl!
    @IBOutlet weak var studentEmailTextField: UITextField!
    @IBOutlet weak var studentIDTextField: UITextField!
    @IBOutlet weak var studentPasswordTextField: UITextField!

    let userRole = "User Role"
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let imagePicker = UIImagePickerController()

    var userToRegister = User(email: "", password: "", firstName: "", lastName: "", role: "")

    private enum Genders: Int {
        case Male = 0, Female
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        userToRegister.role = userDefaults.stringForKey(userRole)!

    }

    override func viewWillDisappear(animated: Bool) {

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

//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }

    @IBAction func nextButtonPressed(sender: AnyObject) {

        // validation of all fields

    }

    @IBAction func chooseImagePressed(sender: AnyObject) {

        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)

    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "registerStudentNext"
        {
            
            saveCurrentUserInfo()
            
            let selectedSegment = Genders(rawValue: studentGenderSegment.selectedSegmentIndex)!
            switch selectedSegment {
            case .Male:
                userToRegister.gender = 1
            case .Female:
                userToRegister.gender = 2
            }

            // destination
            let svc = segue.destinationViewController as! RegisterStudentViewController

            // set destination course
            svc.userToRegister = userToRegister

        }
    }
    
    func saveCurrentUserInfo () {
        
        userToRegister.firstName = studentFirstNameTextField.text!
        userToRegister.lastName = studentLastNameTextField.text!
        userToRegister.email = studentEmailTextField.text!
        userToRegister.studentID = studentIDTextField.text!
        userToRegister.password = studentPasswordTextField.text!

    }


    // MARK: - UIImagePickerControllerDelegate Methods

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //handle media here i.e. do stuff with photo

        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let util = Utils()
        studentProfileImageView.clipsToBounds = true
        studentProfileImageView.image = util.RBSquareImage(chosenImage)

        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }









    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
