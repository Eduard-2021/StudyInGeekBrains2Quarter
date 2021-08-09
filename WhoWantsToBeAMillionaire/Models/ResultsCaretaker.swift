//
//  RecordsCaretaker.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 09.08.2021.
//

import Foundation

final class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Results"
    
    func save(results: [Results]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Results] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Results].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
