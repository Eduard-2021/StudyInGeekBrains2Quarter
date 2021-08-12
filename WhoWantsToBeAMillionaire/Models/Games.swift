//
//  Games.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import  UIKit

class Games {
    public static let shared = Games()
    var gameSession: GameSession?
    var results = [Results]() {
        didSet {
            resultsCaretaker.save(results: self.results)
        }
    }
    var allQuestions: [Question] {
        didSet{
            questionsCaretaker.save(questions: self.allQuestions)
        }
    }
    private init(){
        self.results = self.resultsCaretaker.retrieveResults()
        self.allQuestions = self.questionsCaretaker.retrieveQuestions()
    }
    private let resultsCaretaker = ResultsCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    var orderOfQuestions: Order = .normal
}


