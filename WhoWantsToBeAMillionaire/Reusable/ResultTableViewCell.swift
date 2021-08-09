//
//  ResultTableViewCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 08.08.2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dateOfGame: UILabel!
    @IBOutlet weak var moneyWon: UILabel!
    @IBOutlet weak var persentOfWins: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(name: String, dateOfGame: Date, persent: Int, moneyWon: Int){
        self.name.text = name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        self.dateOfGame.text = dateFormatter.string(from: dateOfGame)
        self.moneyWon.text = String(moneyWon)+"$"
        self.persentOfWins.text = String(persent)+"%"
    }
    
}
