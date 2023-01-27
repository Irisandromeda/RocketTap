//
//  UILabel + Extension.swift
//  RocketTap
//
//  Created by Irisandromeda on 27.01.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment) {
        self.init()
        
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
    }
    
}
