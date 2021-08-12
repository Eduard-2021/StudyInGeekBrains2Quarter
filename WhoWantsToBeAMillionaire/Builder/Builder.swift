//
//  Builder.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 12.08.2021.
//

import UIKit

class ArrayOfQuestionsBuilder {
    private(set) var defaulfArrayOfQuestion: [Question] = {
        return LoadData().loadQuetions()
    }()
    private(set) var arrayOfNewQuestions = [Question]()
    
    func setArrayOfNewQuestions(_ arrayOfNewQuestions: [Question]) {
        var standartArrayOfNewQuestions = arrayOfNewQuestions
        for (index, _) in arrayOfNewQuestions.enumerated() {
            standartArrayOfNewQuestions[index].answerFourth = standartArrayOfNewQuestions[index].correctAnswer
            standartArrayOfNewQuestions[index].question = standartArrayOfNewQuestions[index].question + "\n(\(standartArrayOfNewQuestions[index].correctAnswer))"
            
            //Рандирование ответов в новом массиве вопросов и ответов
            let arrayWithAnswers = [
                standartArrayOfNewQuestions[index].answerFirst,
                standartArrayOfNewQuestions[index].answerSecond,
                standartArrayOfNewQuestions[index].answerThird,
                standartArrayOfNewQuestions[index].answerFourth
            ]
            let arrayOfRandomIndex = GenerationArrayOfRandomNumbers().funcGenerationArrayOfRandomNumbers(generateNumberTo: 4)
            for (indexRandom, valueRandom) in arrayOfRandomIndex.enumerated() {
                switch indexRandom {
                case 0:
                    standartArrayOfNewQuestions[index].answerFirst = arrayWithAnswers[valueRandom]
                case 1:
                    standartArrayOfNewQuestions[index].answerSecond = arrayWithAnswers[valueRandom]
                case 2:
                    standartArrayOfNewQuestions[index].answerThird = arrayWithAnswers[valueRandom]
                case 3:
                    standartArrayOfNewQuestions[index].answerFourth = arrayWithAnswers[valueRandom]
                default:
                    break
                }
            }
        }
        self.arrayOfNewQuestions = standartArrayOfNewQuestions
    }

    func build() {
        if Games.shared.allQuestions.count != 0 {
            Games.shared.allQuestions = Games.shared.allQuestions + self.arrayOfNewQuestions
        }
        else {
            Games.shared.allQuestions = self.defaulfArrayOfQuestion + self.arrayOfNewQuestions
        }
        
        if arrayOfNewQuestions.count != 0 {
            if Games.shared.gameSession == nil {Games.shared.gameSession = GameSession()}
            for index in 1 ... self.arrayOfNewQuestions.count {
                guard let gameSession = Games.shared.gameSession else {return}
                let numberLastQuistions =  Games.shared.gameSession!.numberOfQuestions
                gameSession.moneyTable[numberLastQuistions+index] = (gameSession.moneyTable[numberLastQuistions+index-1])! * 2
            }
            if  Games.shared.gameSession!.numberOfQuestions < Games.shared.allQuestions.count {
                Games.shared.gameSession?.numberOfQuestions = Games.shared.allQuestions.count
            }
            else
            { Games.shared.gameSession?.numberOfQuestions =  Games.shared.gameSession!.numberOfQuestions + self.arrayOfNewQuestions.count
            }
        }
    }
}
