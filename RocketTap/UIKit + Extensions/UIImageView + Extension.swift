//
//  UIImageView + Extension.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(imageName: String, contentMode: UIView.ContentMode) {
        self.init()
        
        guard let image = UIImage(named: imageName) else { return }
        
        self.image = image
        self.contentMode = contentMode
    }
    
}
