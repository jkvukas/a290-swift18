//
//  ViewController.swift
//  BinCalcOfficial
//
//  Created by Jennifer Vukas on 11/8/18.
//  Copyright © 2018 CSCI A290/Swift - Fall 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display: UILabel!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonZero: UIButton!
    @IBOutlet var buttonEqual: UIButton!
    @IBOutlet var buttonPlus: UIButton!
    @IBOutlet var buttonMinus: UIButton!
    @IBOutlet var buttonAC: UIButton!
    @IBOutlet var textLog: UITextView!
    
    var numberIsBeingEntered = false
    
    var theModel = BinModel()
    var myModel = BinModel.self
    
    @IBOutlet weak var debuggingLabel: UILabel!
    
    
    @IBAction func aDigitIsPressed(_ sender: Any) {
        if (sender as! UIButton) == buttonOne {
            display.text! += "1"
        }
        if (sender as! UIButton) == buttonZero {
            display.text! += "0"
        }
        print("in the function aDigitIsPressed(), sender is: \(sender)")
        debuggingLabel.text = "digit"
        
    }
    
    @IBAction func anOperationIsPressed(_ sender: Any) {
        if (sender as! UIButton) == buttonAC {
            theModel.setFirstOperand(ip: "0")
            theModel.setSecondOperand(ip: "0")
            theModel.setOperation(ip: "")
            display.text! = String(theModel.firstOperand!)
            textLog.text! = ""
        }
        if (sender as! UIButton) == buttonPlus {
            theModel.setOperation(ip: "+")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = "0"
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender as! UIButton) == buttonMinus {
            theModel.setOperation(ip: "-")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = "0"
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender as! UIButton) == buttonEqual {
            theModel.setSecondOperand(ip: display.text!)
            display.text! = theModel.eq()
            textLog.text! += "\(theModel.secondOperand)\n"
            textLog.text! += "=\n"
            textLog.text! += "\(theModel.eq())\n"
        }
        print("in the function anOperationIsPressed(), sender is: \(sender)")
        debuggingLabel.text = "digit"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

