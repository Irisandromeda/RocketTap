//
//  GradientButton.swift
//  RocketTap
//
//  Created by Irisandromeda on 29.01.2023.
//

import UIKit
import SnapKit

class GradientButton: UIButton {
    
    private let gradient = GradientView(from: .bottomLeading, to: .topTrailing, startColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0, green: 0.3363192081, blue: 1, alpha: 1), cornerRadius: 16)
    
    init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(gradient)
        
        gradient.translatesAutoresizingMaskIntoConstraints = false
        
        gradient.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
