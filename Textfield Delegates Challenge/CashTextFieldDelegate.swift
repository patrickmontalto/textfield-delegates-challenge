//
//  CashTextFieldDelegate.swift
//  Textfield Delegates Challenge
//
//  Created by Patrick Montalto on 3/29/16.
//  Copyright © 2016 swift. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text! as NSString
        let newText = currentText.stringByReplacingCharactersInRange(range, withString: string)
        
        let digitsText = getDigitsString(newText)
        let formattedText = formatDigitsStringToDollars(digitsText)
        
        textField.text = formattedText
        
        return false
    }
    
    func getDigitsString(string: String) -> String {
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        for c in string.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        return digitText
    }
    
    func formatDigitsStringToDollars(digitsString: String) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        if let doubleFromDigitsString = Double(digitsString) {
            let numberFromDigitsString = doubleFromDigitsString / 100
            return formatter.stringFromNumber(numberFromDigitsString)!
        } else {
            return "Error"
        }
    }
}