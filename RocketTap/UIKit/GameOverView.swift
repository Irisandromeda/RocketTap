//
//  GameOverView.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class GameOverView: UIView {
    
    let logo = LogoView(cornerRadius: 25)
    let pointsLabel = UILabel(text: "56", textColor: .white, font: .spaceGroteskBold(size: 30), textAlignment: .center)
    let titleLabel = UILabel(text: "Самый быстрый палец в галактике!", textColor: #colorLiteral(red: 0, green: 0.6433480978, blue: 1, alpha: 1), font: .spaceGroteskRegular(size: 18), textAlignment: .center)
    let descriptionLabel = UILabel(text: "Ваш результат 56 точек! Это больше чем у 87% игроков.", textColor: .white, font: .spaceGroteskRegular(size: 14), textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0.6433480978, blue: 1, alpha: 1)
        layer.cornerRadius = 16
        
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        addSubview(logo)
        addSubview(pointsLabel)
    }
    
}

    //MARK: AutoLayout

private extension GameOverView {
    private func addConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(130)
            make.height.width.equalTo(50)
        }
        
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pointsLabel.snp.makeConstraints { make in
            make.leading.equalTo(logo.snp.trailing).offset(10)
            make.centerY.equalTo(logo)
        }
        
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel,descriptionLabel], spacing: 20, axis: .vertical, contentMode: .scaleAspectFit)
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
