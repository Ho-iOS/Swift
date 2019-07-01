//
//  ViewController.swift
//  MyCalcul
//
//  Created by Loho on 01/07/2019.
//  Copyright © 2019 Loho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelCalcul: UILabel!
    @IBOutlet var buttons:[UIButton]!
    
    var expresTemp:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        let btnIndex = getButtonIndex(btn: sender)
        let btnStr = buttons[btnIndex].title(for: .normal)!
        var result = 0
        
        expresTemp += btnStr
        labelCalcul.text = expresTemp
        
        if btnStr == "C" {
            labelCalcul.text = "Clear the expression"
            labelResult.text = "0"
            expresTemp = ""
            return
        }
        if btnStr == "=" {
            //123+123/123-123*123
            var numArray = expresTemp.components(separatedBy: ["+","-","*","/","="])
            print(numArray)
            var arrIndex = 0
            var result:Double = 0
            for i in expresTemp.indices {
                if arrIndex == 0 {
                    result = Double(numArray[0]) as! Double
                    arrIndex += 1
                }
                if expresTemp[i] == "*" {
                    result *= Double(numArray[arrIndex]) as! Double
                    arrIndex += 1
                } else if expresTemp[i] == "/" {
                    result /= Double(numArray[arrIndex]) as! Double
                    arrIndex += 1
                } else if expresTemp[i] == "+" {
                    result += Double(numArray[arrIndex]) as! Double
                    arrIndex += 1
                } else if expresTemp[i] == "-" {
                    result -= Double(numArray[arrIndex]) as! Double
                    arrIndex += 1
                } else if expresTemp[i] == "=" {
                    labelResult.text = "\(result)"
                }
            }
        }
    }
    
    func getButtonIndex(btn:UIButton) -> Int {
        for idx in 0 ..< 16 {
            if btn == buttons[idx] { return idx }
        }
        return 0
    }
}
