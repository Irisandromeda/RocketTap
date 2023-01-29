//
//  GameOverViewController.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class GameOverViewController: UIViewController {
    
    let backgroundImage = UIImageView(imageName: "background", contentMode: .scaleAspectFit)
    let gameOverView = GameOverView()
    let restartButton = GradientButton(title: "Начать заново", titleColor: .white)
    let shareButton = GradientButton(title: "Поделиться", titleColor: .white)
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.1176470588, blue: 0.1568627451, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        addConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(gameOverView)
        view.addSubview(restartButton)
        view.addSubview(shareButton)
        
        shareButton.layer.opacity = 0.6
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

    //MARK: AutoLayout

extension GameOverViewController {
    private func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameOverView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().offset(205)
            make.height.equalTo(242)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        restartButton.snp.makeConstraints { make in
            make.top.equalTo(gameOverView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        
        shareButton.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(restartButton)
            make.top.equalTo(restartButton.snp.bottom).offset(20)
        }
    }
}
