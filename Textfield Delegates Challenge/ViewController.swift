//
//  ViewController.swift
//  Textfield Delegates Challenge
//
//  Created by Patrick Montalto on 3/29/16.
//  Copyright © 2016 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Objects
    @IBOutlet var zipcodeField: UITextField!
    @IBOutlet var cashField: UITextField!
    @IBOutlet var lockableField: UITextField!
    @IBOutlet var lockSwitch: UISwitch!
    
    // Textfield delegates
    let zipCodeDelegate = ZipCodeDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    // Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cashField.text = "$0.00"
        
        // Set the three delegates
        zipcodeField.delegate = zipCodeDelegate
        cashField.delegate = cashDelegate
        lockableField.delegate = self
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return lockSwitch.on
    }
    @IBAction func toggleSwitch(sender: AnyObject) {
        if !(sender as! UISwitch).on {
            lockableField.resignFirstResponder()
        }
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return lockSwitch.on
    }
}

