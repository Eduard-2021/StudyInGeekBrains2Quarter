//
//  GameSession.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

class GameSession {
    var name = ""
    var numberOfQuestions: Int = 15 {
        didSet {
            numberOfRemainingQuestions = numberOfQuestions
        }
    }
    var numberOfRemainingQuestions = 15
    var numberOfQuestionsAsked = 0
    var numberOfCorrectAnswers = 0
    var allNumberOfCorrectAnswers = 0
    var numberOfNextQuestion = Observable<Int>(0)
    var moneyWon = 0
    var canWin = 0
    var moneyTable = [1:500,2:1000, 3:2000, 4:3000, 5:5000, 6:10000, 7:15000, 8:25000, 9:50000, 10:100000, 11:200000, 12:400000, 13: 800000, 14: 1500000, 15: 3000000, 16: 6000000, 17: 12000000, 18: 24000000, 19: 48000000, 20: 96000000]
    var arrayOfNumberCurrectAnswers = [(Int,Int)]()
    
}

extension GameSession: GameSessionDelegate {
    func funcGameSessionDelegate(isCorrectAnswer: Bool, playerWonGame: Bool) {
        self.numberOfRemainingQuestions -= 1
        self.numberOfQuestionsAsked += 1
        if isCorrectAnswer && !playerWonGame {
            self.numberOfCorrectAnswers += 1
            self.allNumberOfCorrectAnswers += 1
            self.moneyWon = moneyTable[numberOfCorrectAnswers]!
            self.canWin = moneyTable[numberOfCorrectAnswers+1]!
        }
        else if !isCorrectAnswer {
            arrayOfNumberCurrectAnswers.append((numberOfCorrectAnswers,numberOfQuestionsAsked))
            self.moneyWon = 0
            self.numberOfCorrectAnswers = 0
        }
        else if playerWonGame {
            self.numberOfCorrectAnswers += 1
            self.allNumberOfCorrectAnswers += 1
            self.moneyWon = moneyTable[numberOfCorrectAnswers]!
        }
        self.numberOfNextQuestion.value += 1
    }
}
