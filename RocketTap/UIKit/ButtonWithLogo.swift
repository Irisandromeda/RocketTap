//
//  ButtonWithLogo.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class ButtonWithLogo: UIButton {
    
    let gradientView = GradientView(from: .bottomLeading, to: .topTrailing, startColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0, green: 0.3363192081, blue: 1, alpha: 1), cornerRadius: 40)
    private let logoImage = UIImageView(imageName: "logoName", contentMode: .scaleAspectFit)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(gradientView)
        addSubview(logoImage)
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().offset(-25)
            make.leading.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().offset(-7)
        }
    }
    
}
