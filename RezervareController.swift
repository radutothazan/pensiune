//
//  RezervareController.swift
//  pensiune
//
//  Created by Radu Tothazan on 24/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import UIKit
import Firebase

class RezervareController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var ref : FIRDatabaseReference!
    var user: User!
    //var rezervare : Rezervare!
    var rezervari = [Rezervare]()
    let refreshControl: UIRefreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = FIRDatabase.database().reference()
        uiRefreshControlAction()
        refreshControl.addTarget(self, action: "uiRefreshControlAction", forControlEvents: .ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        
    }
    func uiRefreshControlAction(){
        self.ref.child("rezervare").observeEventType(FIRDataEventType.ChildAdded, withBlock:{(snap) in
            let numeSnap = snap.childSnapshotForPath("nume")
            let dataIncepereSnap = snap.childSnapshotForPath("dataIncepere")
            let dataTerminareSnap = snap.childSnapshotForPath("dataTerminare")
            let rezervare : Rezervare = Rezervare(nume: numeSnap.value as! String)
            rezervare.setDataIncepere(dataIncepereSnap.value as! Int)
            rezervare.setDataTerminare(dataTerminareSnap.value as! Int)
            self.rezervari.append(rezervare)
        })
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rezervari.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rezervareCell", forIndexPath: indexPath) as! RezervareCell
        cell.NumeLabel.text = rezervari[indexPath.row].getNume()
        cell.dataInceput.text = String(rezervari[indexPath.row].getDataIncepere())
        cell.dataTerminare.text = String(rezervari[indexPath.row].getDataTerminare())
        return cell
    }
    

}
