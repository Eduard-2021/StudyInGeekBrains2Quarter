//
//  Results.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 10.08.2021.
//

import UIKit

struct Results: Codable {
    var percentOfCorrectAnswers = 100
    var name = ""
    var moneyWon = 0
    var date = Date()
}
