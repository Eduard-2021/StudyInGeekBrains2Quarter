//
//  GameSession.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

class GameSession {
    var name = ""
    var numberOfRemainingQuestions = 15
    var numberOfQuestionsAsked = 0
    var numberOfCorrectAnswers = 0
    var numberOfNextQuestion = 0
    var moneyWon = 0
    var canWin = 0
    let moneyTable = [1:500,2:1000, 3:2000, 4:3000, 5:5000, 6:10000, 7:15000, 8:25000, 9:50000, 10:100000, 11:200000, 12:400000, 13: 800000, 14: 1500000, 15: 3000000]
    var arrayOfNumberCurrectAnswers = [(Int,Int)]()
    
}

extension GameSession: GameSessionDelegate {
    func funcGameSessionDelegate(isCorrectAnswer: Bool, playerWonGame: Bool) {
        self.numberOfRemainingQuestions -= 1
        self.numberOfQuestionsAsked += 1
        if isCorrectAnswer && !playerWonGame {
            self.numberOfCorrectAnswers += 1
            self.moneyWon = moneyTable[numberOfCorrectAnswers]!
            self.canWin = moneyTable[numberOfCorrectAnswers+1]!
        }
        else if !isCorrectAnswer {
            arrayOfNumberCurrectAnswers.append((numberOfCorrectAnswers,numberOfQuestionsAsked))
            self.moneyWon = 0
            self.numberOfCorrectAnswers = 0
            self.numberOfQuestionsAsked = 0
        }
        else if playerWonGame {
            self.numberOfCorrectAnswers += 1
            self.moneyWon = moneyTable[numberOfCorrectAnswers]!
            arrayOfNumberCurrectAnswers.append((numberOfCorrectAnswers,numberOfQuestionsAsked))
        }
        self.numberOfNextQuestion += 1
    }
}
