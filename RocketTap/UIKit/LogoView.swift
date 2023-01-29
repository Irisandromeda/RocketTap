//
//  LogoView.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class LogoView: UIView {
    
    private let gradient = GradientView(from: .bottomLeading, to: .topTrailing, startColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0, green: 0.3363192081, blue: 1, alpha: 1), cornerRadius: 25)
    
    private let logoImage = UIImageView(imageName: "logoName", contentMode: .scaleAspectFit)
    
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(gradient)
        addSubview(logoImage)
        
        gradient.translatesAutoresizingMaskIntoConstraints = false
        
        gradient.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(19)
        }
    }
    
}
