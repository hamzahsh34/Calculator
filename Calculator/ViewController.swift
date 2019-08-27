//
//  ViewController.swift
//  Calculator
//
//  Created by Hamzah Shahid on 2019-08-26.
//  Copyright © 2019 Hamzah Shahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        var number: Double
        
        isFinishedTypingNumber = true

        if let num = Double(displayLabel.text!) {
            number = num
        } else {
            fatalError("Unconvertable")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        var currentDisplayValue: Double
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    if let val = Double(displayLabel.text!) {
                        currentDisplayValue = val
                    }
                    else {
                        fatalError("Unconvertable")
                    }
                
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

