//
//  GameModel.swift
//  RocketTap
//
//  Created by Irisandromeda on 28.01.2023.
//

import Foundation

protocol GameModelProtocol {
    var score: Int { get set }
    var timeLeft: Int { get set }
    func restartGame()
    func calculatedScore()
}

class GameModel: GameModelProtocol {
    var score: Int = 0
    var timeLeft: Int = 60
    
    func restartGame() {
        score = 0
        timeLeft = 60
    }
    
    func calculatedScore() {
        score += 1
    }
}
