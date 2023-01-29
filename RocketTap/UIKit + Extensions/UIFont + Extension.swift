//
//  UIFont + Extension.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit

extension UIFont {
    
    static func spaceGroteskRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "SpaceGrotesk-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func spaceGroteskBold(size: CGFloat) -> UIFont {
        return UIFont(name: "SpaceGrotesk-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
