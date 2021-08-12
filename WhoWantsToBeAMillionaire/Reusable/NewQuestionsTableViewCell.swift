//
//  newQuestionsTableViewCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 11.08.2021.
//

import UIKit

protocol NewQuestionsDelegate: AnyObject {
    func loadNewQuestion(newQuestion: Question, numberRow: Int)
}

class NewQuestionsTableViewCell: UITableViewCell {
    
    var newQuestionDelegate: NewQuestionsDelegate?
    var newQuestion = Question()
    var numberRow = 0
    
    @IBOutlet weak var questionTextView: UITextView!    
    @IBOutlet weak var correctAnswerTextView: UITextView!
    @IBOutlet weak var unCorrectAnswerFirstTextView: UITextView!
    @IBOutlet weak var unCorrectAnswerSecondTextView: UITextView!
    @IBOutlet weak var unCorrectAnswerThirdTextView: UITextView!
    @IBOutlet weak var stackViewQuestionsAndAnswers: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionTextView.delegate = self
        correctAnswerTextView.delegate = self
        unCorrectAnswerFirstTextView.delegate = self
        unCorrectAnswerSecondTextView.delegate = self
        unCorrectAnswerThirdTextView.delegate = self

    }
    
    func config(loadNewQuestion: Question) {
            questionTextView.text = loadNewQuestion.question
            correctAnswerTextView.text = loadNewQuestion.correctAnswer
            unCorrectAnswerFirstTextView.text = loadNewQuestion.answerFirst
            unCorrectAnswerSecondTextView.text = loadNewQuestion.answerSecond
            unCorrectAnswerThirdTextView.text = loadNewQuestion.answerThird
    }
}

extension NewQuestionsTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        switch textView {
        case questionTextView:
            newQuestion.question = textView.text ?? ""
        case correctAnswerTextView:
            newQuestion.correctAnswer = textView.text ?? ""
        case unCorrectAnswerFirstTextView:
            newQuestion.answerFirst = textView.text ?? ""
        case unCorrectAnswerSecondTextView:
            newQuestion.answerSecond = textView.text ?? ""
        case unCorrectAnswerThirdTextView:
            newQuestion.answerThird = textView.text ?? ""
        default:
            break
        }
        newQuestionDelegate?.loadNewQuestion(newQuestion: newQuestion, numberRow: numberRow)
    }
}
