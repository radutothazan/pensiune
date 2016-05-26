//
//  LogInController.swift
//  pensiune
//
//  Created by Radu Tothazan on 23/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import UIKit
import Firebase

class LogInController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var parolaTextField: UITextField!
    var ref : FIRDatabaseReference!
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func loginAction(sender: AnyObject) {
        self.user = User(email: emailTextField.text!, parola: parolaTextField.text!, privileges: "")
        ref.child("users").child(self.user.getEmail()).observeSingleEventOfType(FIRDataEventType.Value, withBlock: { (snap) in
            if snap.exists(){
             if self.user.getEmail() == snap.value!["user"] as! String && self.user.getParola() == snap.value!["parola"] as! String{
                self.user.setPrivileges(snap.value!["privileges"] as! String)
                if self.user.getPrivileges() == "admin"{
                    self.performSegueWithIdentifier("admin", sender: self)
                }
                else{
                    self.performSegueWithIdentifier("rezervare", sender: self)
                }
                }
            else{
                let alertController = UIAlertController(title: "Eroare", message: "Parola introdusa gresit!", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Anulare", style: .Cancel) { (_) in }
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true,completion: nil)
            }
            }
            else{
                let alertController = UIAlertController(title: "Eroare", message: "User-ul nu exista!", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Anulare", style: .Cancel) { (_) in }
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true,completion: nil)
            }
            })
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rezervare"{
            let vc = segue.destinationViewController as! RezervareController
            vc.user = self.user
        }
        if segue.identifier == "admin"{
            let vc = segue.destinationViewController as! AdminController
            vc.user = self.user
        }
    }
    


}
