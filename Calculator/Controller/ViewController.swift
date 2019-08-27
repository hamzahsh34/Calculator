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
    private var displayValue: Double {
        get {
            if let num = Double(displayLabel.text!) {
                return num
            } else {
                fatalError("Unconvertable")
            }
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalcLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let call = calculator.calculate(symbol: calcMethod) {
                displayValue = call
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                
                    let isInt = floor(displayValue) == displayValue
                
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

