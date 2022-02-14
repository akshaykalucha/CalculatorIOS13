//
//  AppDelegate.swift
//  Calculator Layout
//
//  Created by Akshay Kalucha on 08/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UILabel!
    var firstTouch = true
    var curr = ""
    var opsDone = false
    var currOps:String = ""
    let ops = ["/", "*", "+", "-", "%"]
    func sendText(txt: String) -> String {
        return "kjhdbfjkdhcfbj"
    }
    
    func calculate(ops: String, prev: Int, curr: Int) -> String {
        if ops == "+"{
            return String(prev + curr)
        }else if ops == "*"{
            return String(prev * curr)
        }else if ops == "-"{
            return String(prev - curr)
        } else if ops == "%" {
            return String(prev / curr)
        }else{
            return String(curr)
        }
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        textField.text = "0"
        curr = ""
        currOps = ""
        firstTouch = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "0"
    }
    
    // Button Press
    func changeTField(num: String) {
        if opsDone{
            curr = textField.text!
            textField.text = ""
            opsDone = false
        }
        if textField.text!.count < 9 {
            if firstTouch {
                textField.text = num
            }else{
                textField.text! += num
            }
        }
        print(textField.text!.count)
        firstTouch = false
    }
    @IBAction func fourButton(_ sender: UIButton) {
        changeTField(num: "4")

    }
    @IBAction func sevenButton(_ sender: UIButton) {
        changeTField(num: "7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        changeTField(num: "8")
    }
    @IBAction func nineButton(_ sender: UIButton) {
        changeTField(num: "9")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        changeTField(num: "5")
    }
    @IBAction func sixButton(_ sender: UIButton) {
        changeTField(num: "6")
    }
    @IBAction func oneButton(_ sender: UIButton) {
        changeTField(num: "1")
    }
    @IBAction func twoButton(_ sender: UIButton) {
        changeTField(num: "2")
    }
    @IBAction func threeButton(_ sender: UIButton) {
        changeTField(num: "3")
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        if textField.text != "0" {
            changeTField(num: "0")
        }
    }
    @IBAction func decimalButton(_ sender: UIButton) {
        print("point pressed")
    }
    
    
    // Logic Computations
    @IBAction func multiplyButton(_ sender: UIButton) {
        if curr != "" {
            textField.text = calculate(ops: currOps, prev: Int(curr)!, curr: Int(textField.text!)!)
        }
        curr = textField.text!
        opsDone = true
        currOps = "*"
    }

    @IBAction func divisionButton(_ sender: UIButton) {
        if curr != "" {
            textField.text = calculate(ops: currOps, prev: Int(curr)!, curr: Int(textField.text!)!)
        }
        curr = textField.text!
        opsDone = true
        currOps = "%"
    }
    @IBAction func minusBUtton(_ sender: UIButton) {
        if currOps != "" {
            currOps = "-"
        }
        if curr != "" {
            textField.text = calculate(ops: currOps, prev: Int(curr)!, curr: Int(textField.text!)!)
        }
        opsDone = true
        curr = textField.text!
        currOps = "-"
    }
    @IBAction func addButton(_ sender: UIButton) {
        if curr != "" {
            textField.text = calculate(ops: currOps, prev: Int(curr)!, curr: Int(textField.text!)!)
        }
        opsDone = true
        curr = textField.text!
        currOps = "+"
    }
    @IBAction func equalTo(_ sender: UIButton) {
        textField.text = calculate(ops: currOps, prev: Int(textField.text!)!, curr: Int(curr)!)
        print(currOps, curr, textField.text!)
    }
    @IBAction func inverseBUtton(_ sender: UIButton) {
        if textField.text != "0"{
            textField.text = String(-Int(textField.text!)!)
        }
    }
}

