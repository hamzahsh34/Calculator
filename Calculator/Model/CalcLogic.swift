//
//  CalcLogic.swift
//  Calculator
//
//  Created by Hamzah Shahid on 2019-08-26.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalcLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number * 0.01
        }
        return nil
    }
}

