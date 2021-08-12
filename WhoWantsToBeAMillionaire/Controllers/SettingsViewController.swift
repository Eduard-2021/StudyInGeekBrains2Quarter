//
//  SettingsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 10.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var isSettingChanged: Bool = false

    @IBOutlet weak var logoMillionaire: UIImageView!
    @IBOutlet weak var returnToMenuView: UIButton!
    @IBOutlet weak var choiceofOrderOfQuestions: UISegmentedControl!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    @IBAction func returnToMenuView(_ sender: Any) {
        if isSettingChanged {
            askSaveChanges()
        }
        else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func choiceOfOrderOfQuestions(_ sender: Any) {
        changeState()
        isSettingChanged = !isSettingChanged
        if round(saveChangesButton.alpha*100) == 40 {
            saveChangesButton.alpha = 0.1
            saveChangesButton.isUserInteractionEnabled = false
        }
        else {
            saveChangesButton.alpha = 0.4
            saveChangesButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        isSettingChanged = !isSettingChanged
        saveChangesButton.alpha = 0.1
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnToMenuView.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        logoMillionaire.layer.cornerRadius = 90
        checkStateForSegmentControl()
    }

    
    private func askSaveChanges() {
        let alertController = UIAlertController(title: "Сохранить изменения?", message: nil, preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(confirmAction)
        
        let canAction = UIAlertAction(title: "Нет", style: .default) { [weak self] _ in
            guard let self = self else {return}
            if self.isSettingChanged {
                self.changeState()
                self.dismiss(animated: true, completion: nil)
            }
        }
        alertController.addAction(canAction)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: {  })
    }
    
    
    private func changeState() {
        if Games.shared.orderOfQuestions == .normal {
            Games.shared.orderOfQuestions = .random
        }
        else {
            Games.shared.orderOfQuestions = .normal
        }
    }
    
    private func checkStateForSegmentControl(){
        if Games.shared.orderOfQuestions == .normal {
            choiceofOrderOfQuestions.selectedSegmentIndex = 1
        }
        else {
            choiceofOrderOfQuestions.selectedSegmentIndex = 0
        }
    }

}
