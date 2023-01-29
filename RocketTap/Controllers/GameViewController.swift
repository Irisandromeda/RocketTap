//
//  GameViewController.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    let playButton = ButtonWithLogo(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    let pointsView = GameInfoView(titleLabel: "Нажато", pointsLabel: "0", color: #colorLiteral(red: 0, green: 0.6433480978, blue: 1, alpha: 1))
    let timerView = GameInfoView(titleLabel: "Время", pointsLabel: "1:00", color: UIColor.gray.cgColor)

    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 0.03225039318, green: 0.1574034691, blue: 0.2082021534, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        addConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(playButton)
        view.addSubview(pointsView)
        view.addSubview(timerView)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        pointsView.addImage()
    }
    
}

    //MARK: AutoLayout

extension GameViewController {
    private func addConstraints() {
        playButton.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview().offset(0)
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
