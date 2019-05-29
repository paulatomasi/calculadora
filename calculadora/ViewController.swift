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
    var operation: Operations = .noOperation
    var hasResponse: Bool = false

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        let displayText = displayLabel.text ?? ""
        let buttonTitle = sender.currentTitle ?? ""
        
        if let selectedOperation = Operations(rawValue: sender.tag) {
            switch(selectedOperation) {
            case .clear:
                clear()
            case .sqrt, .pow:
                operation = selectedOperation
                calculate()
            case .div, .times, .minus, .plus:
                hasResponse = false
                operation = selectedOperation
            case .equals:
                calculate()
            default:
                if hasResponse {
                    clear()
                    firstNumber = buttonTitle
                    displayLabel.text = firstNumber
                } else if operation == .noOperation {
                    firstNumber = firstNumber == "0" ? buttonTitle : displayText + buttonTitle
                    displayLabel.text = firstNumber
                } else {
                    secondNumber = secondNumber == "0" ? buttonTitle : displayText + buttonTitle
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
        case .sqrt:
            response = calculadora.squareRoot(number: number)
        case .pow:
            response = calculadora.pow(number: number)
        case .div:
            if number2 == 0.0 {
                response = Float.nan
            } else {
                response = calculadora.div(firstNumber: number, secondNumber: number2)
            }
        case .times:
            response = calculadora.times(firstNumber: number, secondNumber: number2)
        case .minus:
            response = calculadora.minus(firstNumber: number, secondNumber: number2)
        case .plus:
            response = calculadora.plus(firstNumber: number, secondNumber: number2)
        default:
            response = number
        }

        clear()
        firstNumber = response.toString
        displayLabel.text = firstNumber
        hasResponse = true
    }
    
    func clear() {
        firstNumber = "0"
        secondNumber = "0"
        operation = .noOperation
        displayLabel.text = "0"
        hasResponse = false
    }
}

enum Operations: Int {
    case noOperation = 0
    case clear = 1
    case sqrt = 2
    case pow = 3
    case div = 4
    case times = 5
    case minus = 6
    case plus = 7
    case equals = 8
}
