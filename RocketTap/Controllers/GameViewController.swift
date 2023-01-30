//
//  GameViewController.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    var game: GameModel!
    
    var timer: Timer!
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6433480978, blue: 1, alpha: 1)
        button.layer.cornerRadius = 40
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return button
    }()
    
    let gameZone = UIView()
    
    let pointsView = GameInfoView(titleLabel: "Нажато", pointsLabel: "0", color: #colorLiteral(red: 0, green: 0.6433480978, blue: 1, alpha: 1))
    let timerView = GameInfoView(titleLabel: "Время", pointsLabel: "60", color: UIColor.gray.cgColor)

    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 0.03225039318, green: 0.1574034691, blue: 0.2082021534, alpha: 1)
        game = GameModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        addConstraints()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    private func setupSubviews() {
        view.addSubview(gameZone)
        gameZone.addSubview(playButton)
        view.addSubview(pointsView)
        view.addSubview(timerView)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        pointsView.addImage()
        
        playButton.addTarget(self, action: #selector(playButtonTap), for: .touchUpInside)
    }
    
    @objc private func playButtonTap() {
        let randomWidth = CGFloat(arc4random_uniform(UInt32(gameZone.frame.width - 50)))
        let randomHeight = CGFloat(arc4random_uniform(UInt32(gameZone.frame.height - 50)))
        
        UIView.animate(withDuration: 0.1) {
            self.playButton.transform = CGAffineTransform(translationX: randomWidth, y: randomHeight)
        }
        
        game.calculatedScore()
        pointsView.valueLabel.text = "\(game.score)"
    }
    
    @objc private func startTimer() {
        if game.timeLeft > 0 {
            game.timeLeft -= 1
        } else {
            let vc = GameOverViewController(gameModel: game)
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
            timer.invalidate()
        }
        timerView.valueLabel.text = game.timeLeft.description
    }
    
}

    //MARK: AutoLayout

extension GameViewController {
    private func addConstraints() {
        gameZone.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(65)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.bottom.equalTo(pointsView.snp.top).offset(-80)
        }
        
        playButton.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        
        pointsView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-55)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(60)
            make.width.equalTo(143)
        }
        
        timerView.snp.makeConstraints { make in
            make.height.width.bottom.equalTo(pointsView)
            make.trailing.equalTo(-30)
        }
    }
}
