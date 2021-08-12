//
//  AddQuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 11.08.2021.
//

import UIKit

class AddQuestionsViewController: UIViewController {
    
    var numberRows = 1
    var loadNewQuestions = [Question]()
    let sizeIphoneProMax = 926
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var returnToMenuView: UIButton!
    @IBOutlet weak var logoMillionaire: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var constrainHeightLogo: NSLayoutConstraint!
    @IBOutlet weak var constrainAddQuestion: NSLayoutConstraint!
    @IBOutlet weak var constrainBackgroundAddQuestion: NSLayoutConstraint!
    
    @IBAction func addNewQuestion(_ sender: Any) {
        numberRows += 1
        tableView.reloadData()
        self.tableView?.scrollToRow(at: IndexPath(row: numberRows-1, section: 0), at: UITableView.ScrollPosition.bottom, animated: true)
    }

    @IBAction func saveQuestions(_ sender: Any) {
        let builderArrayOfQuestions = ArrayOfQuestionsBuilder()
        saveButton.isUserInteractionEnabled = false
        saveButton.alpha = 0.1
        builderArrayOfQuestions.setArrayOfNewQuestions(loadNewQuestions)
        builderArrayOfQuestions.build()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func funcReturnToMenuView(_ sender: Any) {
//        if isSettingChanged {
//            askSaveChanges()
//        }
//        else {
//            dismiss(animated: true, completion: nil)
//        }
        dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnToMenuView.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        logoMillionaire.layer.cornerRadius = 90
        optivizationSizeSameView()
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewQuestionsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewQuestionsTableViewCell")
        
        
    }
    
    private func optivizationSizeSameView() {
        let sizeCurrentConstrains = constrainHeightLogo.constant+constrainAddQuestion.constant
        let howManyHaveToChangeSize = CGFloat(sizeIphoneProMax)-view.frame.size.height
        let coefficient = (sizeCurrentConstrains-howManyHaveToChangeSize)/sizeCurrentConstrains
        constrainHeightLogo.constant = constrainHeightLogo.constant * coefficient
        constrainAddQuestion.constant = constrainAddQuestion.constant * coefficient
        constrainBackgroundAddQuestion.constant = constrainBackgroundAddQuestion.constant * coefficient
        logoMillionaire.layer.cornerRadius = 90 * coefficient
    }
}

extension AddQuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewQuestionsTableViewCell", for: indexPath) as! NewQuestionsTableViewCell
        cell.newQuestionDelegate = self
        cell.numberRow = indexPath.row
        if loadNewQuestions.count >= indexPath.row+1 {
            cell.config(loadNewQuestion: loadNewQuestions[indexPath.row])
        }
        else {
            cell.config(loadNewQuestion: Question())
        }
        return cell
    }
}

extension AddQuestionsViewController: NewQuestionsDelegate {
    func loadNewQuestion(newQuestion: Question, numberRow: Int) {
        saveButton.isUserInteractionEnabled = true
        saveButton.alpha = 0.4
        if loadNewQuestions.count >= numberRow+1 {
            loadNewQuestions[numberRow] = newQuestion
        }
        else {
            loadNewQuestions.append(newQuestion)
        }
    }
}
