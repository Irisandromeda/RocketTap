//
//  ViewWithPoints.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit

class GameInfoView: UIView {
    
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    let gradientView = GradientView(from: .bottomLeading, to: .topTrailing, startColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0, green: 0.3363192081, blue: 1, alpha: 1), cornerRadius: 12)
    
    init(titleLabel: String, pointsLabel: String, color: CGColor) {
        super.init(frame: .zero)
        
        self.titleLabel.text = titleLabel
        self.valueLabel.text = pointsLabel
        self.layer.borderColor = color
        self.titleLabel.textColor = UIColor(cgColor: color)
        
        setup()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.borderWidth = 1
        layer.cornerRadius = 16
        
        titleLabel.font = .spaceGroteskRegular(size: 14)
        valueLabel.font = .spaceGroteskBold(size: 30)
        
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    func addImage() {
        addSubview(gradientView)
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.snp.makeConstraints { make in
            make.centerY.equalTo(self).offset(0)
            make.leading.equalTo(self).offset(10)
            make.width.height.equalTo(24)
        }
    }
}

    //MARK: AutoLayout

private extension GameInfoView {
    private func addConstraints() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.top).offset(-10)
            make.centerX.equalToSuperview()
        }
    }
}
