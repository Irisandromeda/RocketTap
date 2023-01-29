//
//  UIStackView + Extension.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], spacing: CGFloat, axis: NSLayoutConstraint.Axis, contentMode: UIView.ContentMode) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.spacing = spacing
        self.axis = axis
        self.contentMode = contentMode
    }
    
}
