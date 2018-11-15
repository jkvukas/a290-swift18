//
//  BinModel.swift
//  BinCalcOfficial
//
//  Created by Jennifer Vukas on 11/8/18.
//  Copyright © 2018 CSCI A290/Swift - Fall 2018. All rights reserved.
//

import Foundation

class BinModel {
    var firstOperand: String!
    var secondOperand: String!
    var operation: String!
    var memoryValue: Int
    
    init() {
        firstOperand = ""
        secondOperand = ""
        operation = ""
        memoryValue = 0
    }
    
    func setFirstOperand(ip: String) {
        //let x = Int(ip)
        firstOperand = ip
    }
    
    func setSecondOperand(ip: String) {
        //let x = Int(ip)
        secondOperand = ip
    }
    
    func setOperation(ip: String) {
        operation = ip
    }
    
    //func setMemoryValue(ip: String) {
        //memoryValue = ip
    //}
    
    func performOperation() -> String {
        var op: String!
        if (operation == "") {
            return ""
        }
        if (operation == "+") {
            let ap = firstOperand.binaryToInt
            let bp = secondOperand.binaryToInt
            return "0" + String(ap + bp, radix: 2)
        }
        if (operation == "-") {
            let ap = firstOperand.binaryToInt
            let bp = secondOperand.binaryToInt
            return String(ap - bp, radix: 2)
        }
        if (operation == "*") {
            let ap = firstOperand.binaryToInt
            let bp = secondOperand.binaryToInt
            return "0" + String(ap * bp, radix: 2)
        }
        if (operation == "/") {
            let ap = Int(firstOperand, radix: 2)!
            let bp = Int(secondOperand, radix: 2)!
            op = "0" + String(ap/bp, radix: 2)
        }
        if (operation == "+/-") {
            return ((firstOperand.binaryToInt) * -1).binaryStr
        }
        if (operation == "MC") {
            memoryValue = 0
            return String(memoryValue, radix: 2)
        }
        if (operation == "MR") {
            return String(memoryValue, radix: 2)
        }
        if (operation == "M+") {
            let ap = firstOperand.binaryToInt
            memoryValue += ap
            return String(memoryValue, radix: 2)
            
        }
        if (operation == "M-") {
            let ap = firstOperand.binaryToInt
            memoryValue -= ap
            return String(memoryValue, radix: 2)
        }
        return op
    }
}

extension String {
    var binaryToInt     : Int    { return Int(strtoul(self, nil, 2)) }
    
}

extension Int {
    var binaryStr    : String { return String(self, radix: 2) }
}


