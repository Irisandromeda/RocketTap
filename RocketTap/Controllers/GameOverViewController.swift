//
//  GameOverViewController.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class GameOverViewController: UIViewController {
    
    var game: GameModel!
    
    init(gameModel: GameModel) {
        super.init(nibName: nil, bundle: nil)
        
        game = gameModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundImage = UIImageView(imageName: "background", contentMode: .scaleAspectFit)
    let gameOverView = GameOverView()
    let restartButton = UIButton(title: "Начать заново", titleColor: .white, backgroundColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), cornerRadius: 16, font: .spaceGroteskRegular(size: 18))
    let shareButton = UIButton(title: "Поделиться", titleColor: .white, backgroundColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), cornerRadius: 16, font: .spaceGroteskRegular(size: 18))
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.1176470588, blue: 0.1568627451, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        addConstraints()
        updateData()
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(gameOverView)
        view.addSubview(restartButton)
        view.addSubview(shareButton)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        shareButton.layer.opacity = 0.6
        restartButton.addTarget(self, action: #selector(restartButtonTap), for: .touchUpInside)
    }
    
    private func updateData() {
        gameOverView.pointsLabel.text = game.score.description
        gameOverView.descriptionLabel.text = "Ваш результат \(game.score) точек! Это больше чем у 87% игроков."
    }
    
    @objc private func restartButtonTap() {
        game.restartGame()
        
        let vc = GameViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
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
