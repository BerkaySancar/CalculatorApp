//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Berkay Sancar on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var operation           = 0
    var numOnScreen: Float  = 0
    var firstNum: Float     = 0
    var isTappedOpBttn      = false
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if isTappedOpBttn == false {
            
            resultLabel.text = resultLabel.text! + String(sender.tag)
            numOnScreen = Float(resultLabel.text!)!
            
        } else {
            
            resultLabel.text = String(sender.tag)
            numOnScreen = Float(resultLabel.text!)!
            isTappedOpBttn = false
        
        }
    }
    
    @IBAction func operationButtons(_ sender: UIButton) {
        
        /* Reason: if user tapped two times operations buttons, keep the app running. */
        switch resultLabel.text {
        case "/","-","+","X",".","":
            switch operation {
            case 13,14,15,16,17,20:
                resultLabel.text = ""
                operation = 0
                firstNum = 0
                numOnScreen = 0
            default:
                ()
            }
        default:
            ()
        }
        
        /* Operations */
        
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 && sender.tag != 18 && sender.tag != 19 && sender.tag != 20 {
            
            firstNum = Float(resultLabel.text!)!
            
            if sender.tag == 13 {
                
                resultLabel.text = "/"
                
            } else if sender.tag == 14 {
                
                resultLabel.text = "X"
                
            } else if sender.tag == 15 {
                
                resultLabel.text = "-"
                
            } else if sender.tag == 16 {
                
                resultLabel.text = "+"
                
            }
            
            operation = sender.tag
            isTappedOpBttn = true
            
        } else if sender.tag == 12 {    // 12-equals button operations
            
            if operation == 13 {
                
                resultLabel.text = String(Float(firstNum) / Float(numOnScreen))
                
            } else if operation == 14 {
                
                resultLabel.text = String(Float(firstNum) * Float(numOnScreen))
            
            } else if operation == 15 {
                
                resultLabel.text = String(Float(firstNum) - Float(numOnScreen))
                
            } else if operation == 16 {
                
                resultLabel.text = String(Float(firstNum) + Float(numOnScreen))
            }
            
        } else if sender.tag == 11 {  // 11-AC button operations
            
            resultLabel.text = ""
            operation = 0
            firstNum = 0
            numOnScreen = 0
            
        } else if sender.tag == 17 { // 17-"." button operations
            
            if resultLabel.text?.last != "." {
                resultLabel.text = resultLabel.text! + "."
            }
            
        } else if sender.tag == 18 { //18-backspace button operations
            
            if resultLabel.text != "" {
                
            resultLabel.text?.removeLast()
                
            }
            
        } else if sender.tag == 19 { //19-Negative/Positive button operations
            
            if resultLabel.text?.first == "-" {
                resultLabel.text?.removeFirst()
                
            } else {
                
                resultLabel.text?.insert("-", at: resultLabel.text!.startIndex)
                
            }
            
        } else if sender.tag == 20 { //20-% button operations
            
            if resultLabel.text != "" {
                
                resultLabel.text = String(Float(resultLabel.text!)! * Float(0.01))
                numOnScreen = Float(resultLabel.text!)!
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        UserDefaults.standard.set(false, forKey: "NSConstraintBasedLayoutLogUnsatisfiable")
        UserDefaults.standard.set(false, forKey: "__NSConstraintBasedLayoutLogUnsatisfiable")
        
    }
    
}
