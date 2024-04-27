//
//  UIColor+Ext.swift
//  RandomColors
//
//  Created by Ilkin Mammadli on 27.04.24.
//

import UIKit

extension UIColor {

    static func random() -> UIColor {
        let randomColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
        return randomColor
    }
    
    func toHex() -> String? {
            guard let components = self.cgColor.components, components.count >= 3 else {
                return nil
            }
            
            let r = Int(components[0] * 255)
            let g = Int(components[1] * 255)
            let b = Int(components[2] * 255)
            
            return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    func inverted() -> UIColor? {
            guard let components = cgColor.components, components.count >= 3 else {
                return nil // Not an RGB color
            }
            
            let invertedRed = 1.0 - components[0]
            let invertedGreen = 1.0 - components[1]
            let invertedBlue = 1.0 - components[2]
            
            return UIColor(red: invertedRed, green: invertedGreen, blue: invertedBlue, alpha: components.count >= 4 ? components[3] : 1.0)
    }
}
