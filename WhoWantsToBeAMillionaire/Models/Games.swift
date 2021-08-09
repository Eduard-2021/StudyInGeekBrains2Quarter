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
    private init(){
        self.results = self.resultsCaretaker.retrieveResults()
    }
    private let resultsCaretaker = ResultsCaretaker()
}

struct Results: Codable {
    var percentOfCorrectAnswers = 100
    var name = ""
    var moneyWon = 0
    var date = Date()
}
