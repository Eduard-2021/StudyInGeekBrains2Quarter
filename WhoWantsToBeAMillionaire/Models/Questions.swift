//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

struct Question: Codable {
    var question: String = ""
    var answerFirst: String = ""
    var answerSecond: String = ""
    var answerThird: String = ""
    var answerFourth: String = ""
    var correctAnswer: String = ""
}
