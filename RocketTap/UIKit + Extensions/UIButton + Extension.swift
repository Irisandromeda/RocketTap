//
//  UIButton + Extension.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, font: UIFont) {
        self.init(type: .system)

        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = font
    }
    
}
