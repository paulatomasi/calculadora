//
//  Extensions.swift
//  calculadora
//
//  Created by Paula Tomasi Andrade on 28/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Float {
    var toString: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
