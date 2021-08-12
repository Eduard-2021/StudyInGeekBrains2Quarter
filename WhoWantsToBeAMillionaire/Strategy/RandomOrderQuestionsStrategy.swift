//
//  RandomOrderQuestionsStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 10.08.2021.
//

import UIKit

class RandomOrderQuestionsStrategy: OrderQuestionsStrategy {
    func orderQuestionsStrategy(allQuestions: [Question]) -> [Question] {
        guard let gameSession = Games.shared.gameSession else {return allQuestions }
        var randomAllQuestions = [Question]()
        if gameSession.numberOfNextQuestion.value != 0 {
            randomAllQuestions += allQuestions[0 ... gameSession.numberOfNextQuestion.value-1]
        }
        let arrayOfRandomNumbers = GenerationArrayOfRandomNumbers().funcGenerationArrayOfRandomNumbers(generateNumberTo: gameSession.numberOfRemainingQuestions)
        
        for index in arrayOfRandomNumbers {
            randomAllQuestions.append(allQuestions[index+gameSession.numberOfNextQuestion.value])
        }
        return randomAllQuestions
    }
}

