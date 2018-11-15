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
    @IBOutlet var buttonMult: UIButton!
    @IBOutlet var buttonDiv: UIButton!
    @IBOutlet var buttonInvert: UIButton!
    @IBOutlet var buttonMC: UIButton!
    @IBOutlet var buttonMR: UIButton!
    @IBOutlet var buttonMPlus: UIButton!
    @IBOutlet var buttonMMinus: UIButton!
    
    
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
    
    @IBAction func anOperationIsPressed(_ sender: UIButton) {
        if (sender.tag == 3) { //clear
            //theModel.setFirstOperand(ip: "0")
            //theModel.setSecondOperand(ip: "0")
            theModel.setOperation(ip: "")
            display.text! = String(theModel.performOperation())
            textLog.text! = ""
        }
        if (sender.tag == 4) { //plus
            theModel.setOperation(ip: "+")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = ""
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender.tag == 5) { //minus
            theModel.setOperation(ip: "-")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = ""
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender.tag == 9) { //equal
            theModel.setSecondOperand(ip: display.text!)
            display.text! = theModel.performOperation()
            textLog.text! += "\(theModel.secondOperand)\n"
            textLog.text! += "=\n"
            textLog.text! += "\(theModel.performOperation())\n"
        }
        if (sender.tag == 6) { //multiply
            theModel.setOperation(ip: "*")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = ""
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender.tag == 7) { //divide
            theModel.setOperation(ip: "/")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = ""
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender.tag == 8) { //invert
            theModel.setOperation(ip: "+/-")
            //display.text! = theModel.operation
            theModel.setFirstOperand(ip: display.text!)
            display.text! = theModel.performOperation()
            textLog.text! += "\(theModel.firstOperand)\n"
            textLog.text! += "\(theModel.operation)\n"
        }
        if (sender.tag == 10) { //Memory Clear
            theModel.setOperation(ip: "MC")
            display.text! = theModel.performOperation()
        }
        if (sender.tag == 11) { //Memory Recall
            theModel.setOperation(ip: "MR")
            display.text! = theModel.performOperation()
        }
        if (sender.tag == 12) { //Memory Add
            theModel.setOperation(ip: "M+")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = theModel.performOperation()
        }
        if (sender.tag == 13) { //Memory Subtract
            theModel.setOperation(ip: "M-")
            theModel.setFirstOperand(ip: display.text!)
            display.text! = theModel.performOperation()
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

