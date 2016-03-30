//
//  ZipCodeTextFieldDelegate.swift
//  Textfield Delegates Challenge
//
//  Created by Patrick Montalto on 3/29/16.
//  Copyright © 2016 swift. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let maximumLength = 5
        let currentText = textField.text! as NSString
        let newText = currentText.stringByReplacingCharactersInRange(range, withString: string) as NSString
        
        return newText.length <= maximumLength
            
    }
}