//
//  AppDelegate.swift
//  Calculator Layout
//
//  Created by Akshay Kalucha on 08/02/22.
//

import UIKit

class ViewController: UIViewController {
    func sendText(txt: String) -> String {
        return "kjhdbfjkdhcfbj"
    }
    @IBOutlet weak var textField: UILabel!
    var firstTouch = true
    override func viewDidLoad() {
        super.viewDidLoad()
        let currText = textField.text
        print(currText ?? "kjbjk")
    }
    @IBAction func fourButton(_ sender: UIButton) {
        print("4 touched")
        if firstTouch {
            textField.text = "4"
        }else{
            textField.text! += "4"
        }
        firstTouch = false
    }

    @IBAction func sevenButton(_ sender: UIButton) {
        print("7 pressed")
    }
}

