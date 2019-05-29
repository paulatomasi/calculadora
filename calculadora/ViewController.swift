//
//  ViewController.swift
//  calculadora
//
//  Created by Paula Tomasi Andrade on 27/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var calculadora = Calculadora()
    var firstNumber: String = "0"
    var secondNumber: String = "0"
    var operation: String = ""
    var hasResponse: Bool = false

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        let displayText = displayLabel.text ?? ""
        
        if let buttonTitle = sender.currentTitle {
            switch(buttonTitle) {
            case "AC":
                clear()
            case "√x", "x²":
                operation = buttonTitle
                calculate()
            case "÷", "x", "-", "+":
                hasResponse = false
                operation = buttonTitle
            case "=":
                if secondNumber != "0" {
                    calculate()
                }
            default:
                if hasResponse {
                    clear()
                    firstNumber = buttonTitle
                    displayLabel.text = firstNumber
                } else if operation.isEmpty {
                    if firstNumber == "0" {
                        firstNumber = buttonTitle
                    } else {
                        firstNumber = displayText + buttonTitle
                    }
                    displayLabel.text = firstNumber
                } else {
                    if secondNumber == "0" {
                        secondNumber = buttonTitle
                    } else {
                        secondNumber = displayText + buttonTitle
                    }
                    displayLabel.text = secondNumber
                }
            }
        }
    }
    
    func calculate() {
        let number = firstNumber.floatValue
        let number2 = secondNumber.floatValue
        var response: Float = 0.0
        
        switch(operation) {
        case "√x":
            response = calculadora.squareRoot(number: number)
        case "x²":
            response = calculadora.pow(number: number)
        case "÷":
            response = calculadora.div(firstNumber: number, secondNumber: number2)
        case "x":
            response = calculadora.times(firstNumber: number, secondNumber: number2)
        case "-":
            response = calculadora.minus(firstNumber: number, secondNumber: number2)
        case "+":
            response = calculadora.plus(firstNumber: number, secondNumber: number2)
        default:
            break
        }
        
        clear()
        firstNumber = response.toString
        displayLabel.text = firstNumber
        hasResponse = true
    }
    
    func clear() {
        firstNumber = "0"
        secondNumber = "0"
        operation = ""
        displayLabel.text = "0"
        hasResponse = false
    }
}


