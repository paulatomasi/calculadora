//
//  Calculadora.swift
//  calculadora
//
//  Created by Paula Tomasi Andrade on 27/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Calculadora {
    
    func plus(firstNumber x: Float, secondNumber y: Float) -> Float {
        return x + y
    }
    
    func minus(firstNumber x: Float, secondNumber y: Float) -> Float {
        return x - y
    }
    
    func times(firstNumber x: Float, secondNumber y: Float) -> Float {
        return x * y
    }
    
    func div(firstNumber x: Float, secondNumber y: Float) -> Float {
        return x / y
    }
    
    func pow(number x: Float) -> Float {
        return Foundation.pow(x, 2)
    }
    
    func squareRoot(number x: Float) -> Float {
        return sqrt(x)
    }
}

