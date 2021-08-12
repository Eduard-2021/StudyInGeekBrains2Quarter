//
//  OrderQuestionsStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 10.08.2021.
//

import UIKit

protocol OrderQuestionsStrategy {
    func orderQuestionsStrategy(allQuestions: [Question]) -> [Question]
}
