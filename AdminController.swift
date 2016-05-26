//
//  AdminController.swift
//  pensiune
//
//  Created by Radu Tothazan on 24/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import UIKit
import Firebase

class AdminController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref : FIRDatabaseReference!
    var user: User!
    var users :[String] = [""]
    @IBOutlet weak var tableView: UITableView!
    let refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = FIRDatabase.database().reference()
        self.users.removeAll()
        uiRefreshControlAction()
        refreshControl.addTarget(self, action: "uiRefreshControlAction", forControlEvents: .ValueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    func uiRefreshControlAction(){
        self.ref.child("users").observeEventType(FIRDataEventType.ChildAdded, withBlock:{(snap) in
            if !self.users.contains(snap.key)
            {
                self.users.append(snap.key)
            }
        })
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func addAction(sender: AnyObject) {
        let alertController = UIAlertController(title: "Adaugare", message: "Utilizator", preferredStyle: .Alert)
        let addAction = UIAlertAction(title: "Adaugare", style: .Default){ (_) in
            let user = alertController.textFields![0] as UITextField
            let parola = alertController.textFields![1] as UITextField
            let privileges = alertController.textFields![2] as UITextField
            self.ref.child("users").child(user.text!).child("user").setValue(user.text!)
            self.ref.child("users").child(user.text!).child("parola").setValue(parola.text!)
            self.ref.child("users").child(user.text!).child("privileges").setValue(privileges.text!)
        }
        alertController.addTextFieldWithConfigurationHandler{(textField) in
            textField.placeholder = "User"
        }
        alertController.addTextFieldWithConfigurationHandler{(textField) in
            textField.placeholder = "Parola"
            textField.secureTextEntry = true
        }
        alertController.addTextFieldWithConfigurationHandler{(textField) in
            textField.placeholder = "Privilegiu"
        }
        
        let cancelAction = UIAlertAction(title: "Anulare", style: .Cancel) { (_) in }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        self.presentViewController(alertController, animated: true,completion: nil)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.users.count)
        return self.users.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! AdminCell
        cell.nameLabel.text = users[indexPath.row]
        return cell
    }
    
    
    
    
    

    @IBAction func logoutAction(sender: AnyObject) {
        performSegueWithIdentifier("logoutAdmin", sender: self)
    }

}
