//
//  LoginViewController.swift
//  i_Xplore
//
//  Created by Justin on 6/13/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var failure: UILabel!
    
    @IBAction func LoginButtontapped(sender: UIButton) {
        let emailGiven = email.text
        let passwordGiven = password.text
        let (failure_message, user) = UserController.sharedInstance.loginUser(emailGiven!, suppliedPassword: passwordGiven!)
        
        // Validate the email
//        if(!email.validate()){
//            email.updateUI()
//            return
//        }
        
        
        if (user != nil) {
            print("User registered view registration view")
            
            // Store user
            NSUserDefaults.standardUserDefaults().setValue("sss", forKey: "userIsLoggedIn")
            
            // Move to the game
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.navigateToJournalNavigationController()
            
            
        }
        if (failure_message != nil){
            failure.text = failure_message
            print("\(failure_message)")
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        //        self.view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
        
        email.delegate = self
        password.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == email){
            print("email field just had a keystroke")
            print("textfield.text: \(email.text)")
            print("string: \(string)")
        }
        else if (textField == password){
            print("password field just had a keystroke")
            print("textfield.text: \(password.text)")
            print("string: \(string)")
        }
        
        return true
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
