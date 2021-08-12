//
//  SecondViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

class MenuViewController: UIViewController {

    private let dispGroup = DispatchGroup()
    
    @IBOutlet weak var logoMillionaire: UIImageView!
    @IBAction func pressButtonPlay(_ sender: Any) {
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! QuestionsViewController
        let gameSession = GameSession()
        
        if (Games.shared.gameSession?.name == "") || Games.shared.gameSession == nil {
           if Games.shared.gameSession == nil {Games.shared.gameSession = gameSession}
           if  Games.shared.gameSession!.numberOfQuestions < Games.shared.allQuestions.count {
            Games.shared.gameSession?.numberOfQuestions = Games.shared.allQuestions.count
           }
           nameInput(vc: thirdVC)
           thirdVC.gameSessionDelegate = Games.shared.gameSession.self
        }
        else {
            thirdVC.gameSessionDelegate = Games.shared.gameSession.self
            present(thirdVC, animated: true)
        }
        thirdVC.dismissDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoMillionaire.layer.cornerRadius = 90
    }
    
    
    private func nameInput(vc: UIViewController) {
        let alertController = UIAlertController(title: "Введите Ваше имя", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
        })
        let confirmAction = UIAlertAction(title: "Продолжить", style: .default) { [weak self] action in
            if let answer = alertController.textFields?[0].text  {
                if answer != "" {
                    Games.shared.gameSession?.name = answer
                    self!.present(vc, animated: true)
                }
                else {self!.nameInput(vc: vc)}
            }
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: {  })
        }
    }
}

extension MenuViewController: DismissDelegete {
    func funcDismissDelegate() {
        dismiss(animated: false, completion: nil)
    }
    
    
}
