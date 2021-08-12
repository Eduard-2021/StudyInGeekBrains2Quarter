//
//  GenerationArrayOfRandomNumbers.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 12.08.2021.
//

import UIKit

class GenerationArrayOfRandomNumbers {
    func funcGenerationArrayOfRandomNumbers(generateNumberTo:Int) -> [Int] {
        var arrayOfRandomNumbers = [Int]()
        for _ in 0 ... generateNumberTo-1 {
            var isCorrectRandomNumber = false
            repeat {
                let randomNumber = Int(arc4random_uniform(UInt32(generateNumberTo)))
                if !arrayOfRandomNumbers.contains(randomNumber) {
                    arrayOfRandomNumbers.append(randomNumber)
                    isCorrectRandomNumber = true
                }
            }
            while !isCorrectRandomNumber
        }
        return arrayOfRandomNumbers
    }
}

