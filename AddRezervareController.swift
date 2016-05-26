//
//  AddRezervareController.swift
//  pensiune
//
//  Created by Radu Tothazan on 24/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import UIKit
import Firebase

class AddRezervareController: UIViewController {

    @IBOutlet weak var dataTerminareOutlet: UITextField!
    @IBOutlet weak var dataIncepereOutlet: UITextField!
    @IBOutlet weak var numarPersoaneOutlet: UITextField!
    @IBOutlet weak var numeOutlet: UITextField!
    var rezervare :Rezervare!
    var ref : FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func CreeareAction(sender: AnyObject) {
        let test = dataIncepereOutlet.text
        var test1 = ""
        var dataIncepereInt: Int!
        for var i=0; i < test!.characters.count; i = i + 1{
            if test![test!.startIndex.advancedBy(i)] != " "{
                test1.append(test![test!.startIndex.advancedBy(i)])
            }
        }
        dataIncepereInt = Int(test1)
        
        let test2 = dataTerminareOutlet.text
        var test3 = ""
        var dataTerminareInt: Int!
        for var i=0; i < test2!.characters.count; i = i + 1{
            if test2![test2!.startIndex.advancedBy(i)] != " "{
                test3.append(test2![test2!.startIndex.advancedBy(i)])
            }
        }
        dataTerminareInt = Int(test3)
        self.rezervare = Rezervare(nume: numeOutlet.text!, dataIncepere: dataIncepereInt , dataTerminare: dataTerminareInt, numarPersoane: Int(numarPersoaneOutlet.text!)!)
        self.ref.child("rezervare").childByAutoId().setValue(["nume": rezervare.getNume(), "dataIncepere": rezervare.getDataIncepere(), "dataTerminare": rezervare.getDataTerminare(), "numarPersoane": rezervare.getNumarPersoane()])
        performSegueWithIdentifier("BackToRezervare", sender: self)
        
    }
    @IBAction func anulareAction(sender: AnyObject) {
        performSegueWithIdentifier("BackToRezervare", sender: self)
        
    }
    @IBAction func dataIncepereAction(sender: UITextField) {
        let currentDate: NSDate = NSDate()
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = NSTimeZone(name: "UTC")!
        
        let components: NSDateComponents = NSDateComponents()
        components.calendar = calendar
        
        components.year = 0
        let minDate: NSDate = calendar.dateByAddingComponents(components, toDate: currentDate, options: NSCalendarOptions(rawValue: 0))!
        
        
        
        let inputView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 240))
        let datePickerView  : UIDatePicker = UIDatePicker(frame: CGRectMake(0, 40, 0, 0))
        datePickerView.datePickerMode = UIDatePickerMode.Date
        inputView.addSubview(datePickerView)
        
        let doneButton = UIButton(frame: CGRectMake((self.view.frame.size.width/2) - (100/2), 0, 100, 50))
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitle("Done", forState: UIControlState.Highlighted)
        doneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        inputView.addSubview(doneButton)
        
        doneButton.addTarget(self, action: "doneButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        sender.inputView = inputView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        datePickerView.minimumDate = minDate
        
        
        
    }
    @IBAction func dataTerminareAction(sender: UITextField) {
        let currentDate: NSDate = NSDate()
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = NSTimeZone(name: "UTC")!
        
        let components: NSDateComponents = NSDateComponents()
        components.calendar = calendar
        
        components.year = 0
        components.day = 1
        let minDate: NSDate = calendar.dateByAddingComponents(components, toDate: currentDate, options: NSCalendarOptions(rawValue: 0))!
        
        
        
        let inputView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 240))
        let datePickerView  : UIDatePicker = UIDatePicker(frame: CGRectMake(0, 40, 0, 0))
        datePickerView.datePickerMode = UIDatePickerMode.Date
        inputView.addSubview(datePickerView)
        
        let doneButton = UIButton(frame: CGRectMake((self.view.frame.size.width/2) - (100/2), 0, 100, 50))
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitle("Done", forState: UIControlState.Highlighted)
        doneButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        inputView.addSubview(doneButton)
        
        doneButton.addTarget(self, action: "doneButton1:", forControlEvents: UIControlEvents.TouchUpInside)
        
        sender.inputView = inputView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged1:"), forControlEvents: UIControlEvents.ValueChanged)
        datePickerView.minimumDate = minDate
        
    }
    func datePickerValueChanged(sender:UIDatePicker) {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateFormat = "dd MM yyyy"
        dataIncepereOutlet.text = dateFormatter.stringFromDate(sender.date)
    
    }
    func doneButton(sender:UIButton)
    {
        dataIncepereOutlet.resignFirstResponder()
    }
    func datePickerValueChanged1(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.dateFormat = "dd MM yyyy"
        dataTerminareOutlet.text = dateFormatter.stringFromDate(sender.date)
        
    }
    func doneButton1(sender:UIButton)
    {
        dataTerminareOutlet.resignFirstResponder()
    }
}
