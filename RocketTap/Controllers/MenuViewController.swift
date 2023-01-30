//
//  MenuViewController.swift
//  RocketTap
//
//  Created by Irisandromeda on 27.01.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    let backgroundImage = UIImageView(imageName: "background", contentMode: .scaleAspectFit)
    let logoImage = UIImageView(imageName: "logo", contentMode: .scaleAspectFit)
    
    let titleLabel = UILabel(text: "Новый тайм-киллер", textColor: .white, font: .spaceGroteskRegular(size: 18), textAlignment: .center)
    let descriptionLabel = UILabel(text: "Нажми как можно больше точек за 1 минуту, соревнуйся с другими игроками", textColor: .gray, font: .spaceGroteskRegular(size: 18), textAlignment: .center)
    let appVersionLabel = UILabel(text: "RocketTap v1.0", textColor: .gray, font: .spaceGroteskRegular(size: 18), textAlignment: .center)
    
    let startButton = UIButton(title: "Начать игру", titleColor: .white, backgroundColor: #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1), cornerRadius: 16, font: .spaceGroteskRegular(size: 18))
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 0.03225039318, green: 0.1574034691, blue: 0.2082021534, alpha: 1)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        addConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(appVersionLabel)
        view.addSubview(startButton)
        
        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        descriptionLabel.numberOfLines = 0
        
        startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
    }
    
    @objc private func startButtonTap() {
        let vc = GameViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

    //MARK: AutoLayout

private extension MenuViewController {
    private func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().offset(245)
            make.leading.equalToSuperview().offset(75)
            make.trailing.equalToSuperview().offset(-75)
        }
        
        let labelStackView = UIStackView(arrangedSubviews: [titleLabel,descriptionLabel], spacing: 40, axis: .vertical, contentMode: .scaleAspectFit)

        view.addSubview(labelStackView)

        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(80)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        appVersionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(-40)
        }
        
    }
}
