//
//  BinModel.swift
//  BinCalcOfficial
//
//  Created by Jennifer Vukas on 11/8/18.
//  Copyright © 2018 CSCI A290/Swift - Fall 2018. All rights reserved.
//

import Foundation

class BinModel {
    var firstOperand: Int!
    var secondOperand: Int!
    var operation: String!
    
    init() {
        firstOperand = 0
        secondOperand = 0
        operation = ""
    }
    
    func setFirstOperand(ip: String) {
        let x = Int(ip)
        firstOperand = x
    }
    
    func setSecondOperand(ip: String) {
        let x = Int(ip)
        secondOperand = x
    }
    
    func setOperation(ip: String) {
        operation = ip
    }
    
    func eq() -> String {
        var op: String!
        if (operation == "") {
            op = firstOperand.binaryString
        }
        if (operation == "+") {
            op = (firstOperand.binaryString.binaryToInt+secondOperand.binaryString.binaryToInt).binaryString
        }
        if (operation == "-") {
            op = (firstOperand.binaryString.binaryToInt - secondOperand.binaryString.binaryToInt).binaryString
        }
        return op
    }
}

extension String {
    var hexaToInt       : Int    { return Int(strtoul(self, nil, 16)) }
    var hexaToDouble    : Double { return Double(strtoul(self, nil, 16)) }
    var hexaToBinary    : String { return String(hexaToInt, radix: 2) }
    var decimalToHexa   : String { return String(Int(self) ?? 0, radix: 1) }
    var decimalToBinary : String { return String(Int(self) ?? 0, radix: 2) }
    var binaryToInt     : Int    { return Int(strtoul(self, nil, 2)) }
    var binaryToDouble  : Double { return Double(strtoul(self, nil, 2)) }
    var binaryToHexa    : String { return String(binaryToInt, radix: 16) }
    
}

extension Int {
    var binaryString    : String { return String(self, radix: 2) }
    var hexaString      : String { return String(self, radix: 16)}
    var doubleValue     : Double { return Double(self)}
}


