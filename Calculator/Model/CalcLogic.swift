//
//  CalcLogic.swift
//  Calculator
//
//  Created by Hamzah Shahid on 2019-08-26.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalcLogic {
    
    private var number: Double?
    private var intermediateCalc: (n1: Double, cmethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                return performTwoNumberCalc(n2: n)
            } else {
                intermediateCalc = (n1: n, cmethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalc(n2: Double) -> Double? {
        
            if let n1 = intermediateCalc?.n1, let operation = intermediateCalc?.cmethod {
            
                switch operation {
                case "+":
                    return n1 + n2
                case "×":
                    return n1 * n2
                case "-":
                    return n1 - n2
                case "÷":
                    return n1 / n2
                default:
                    fatalError("Invalid Operation")
                }
            }
            return nil
    }
}

