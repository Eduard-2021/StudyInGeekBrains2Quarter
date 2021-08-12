//
//  FourthViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 08.08.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var logoMillionaire: UIImageView!
    
    @IBOutlet weak var returnToMenuView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func returnToMenuView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logoMillionaire.layer.cornerRadius = 90
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ResultTableViewCell")
        
        returnToMenuView.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
    }

}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Games.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as! ResultTableViewCell
        let onePlayer = Games.shared.results[indexPath.row]
        cell.config(name: onePlayer.name, dateOfGame: onePlayer.date, persent: onePlayer.percentOfCorrectAnswers, moneyWon: onePlayer.moneyWon)
        return cell
    }
    
    
}
