//
//  ThirdViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

protocol GameSessionDelegate: AnyObject {
    func funcGameSessionDelegate(isCorrectAnswer: Bool, playerWonGame: Bool)
}

protocol DismissDelegete: AnyObject{
    func funcDismissDelegate()
}

class QuestionsViewController: UIViewController {
    
    let sizeIphoneProMax = 926
    var coefficientForChangeSizeConstrains: CGFloat = 1
    var gameSessionDelegate: GameSessionDelegate?
    var dismissDelegate: DismissDelegete?
    var isChangeWithObserver = true
    let classLoadData = LoadData()
    let builderQuestions = ArrayOfQuestionsBuilder()
    let orderQuestionsStrategy: OrderQuestionsStrategy = {
        switch Games.shared.orderOfQuestions {
        case .normal:
            return NormalOrderQuestionsStrategy()
        case .random:
            return RandomOrderQuestionsStrategy()
        }
    }()

    @IBOutlet weak var logoMillionaire: UIImageView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionBackground: UILabel!
    @IBOutlet weak var answerFirst: UIButton!
    @IBOutlet weak var answerSecond: UIButton!
    @IBOutlet weak var answerThird: UIButton!
    @IBOutlet weak var answerFourth: UIButton!
    @IBOutlet weak var numberOfQuestionBackground: UILabel!
    @IBOutlet weak var currentAnswersBackground: UILabel!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    @IBOutlet weak var persentCurrentAnswersLabel: UILabel!
    @IBOutlet weak var constrainHeightLogo: NSLayoutConstraint!
    @IBOutlet weak var constrainQuestion: NSLayoutConstraint!
    @IBOutlet weak var constrainQuestionBackground: NSLayoutConstraint!
    
    
    private func checkResult(answer:UIButton!){
        guard let gameSession = Games.shared.gameSession else {return}
        guard var answerNew = answer.titleLabel?.text else {return}
        answerNew.removeFirst(3)
        if answerNew == Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].correctAnswer {
            
            if gameSession.numberOfRemainingQuestions-1 != 0 {
                gameSessionDelegate?.funcGameSessionDelegate(isCorrectAnswer: true, playerWonGame: false)
                alertForThirdViewController(mainMessage: "Поздравляем!\n Вы заработали \(gameSession.moneyWon)$", secondMessage: "Вы можете выиграть \(gameSession.canWin)$ \n Продолжаем?", answerCorrect: true, isLastQuistion: false, actionGame: "Продолжить")
            }
            else {
                gameSessionDelegate?.funcGameSessionDelegate(isCorrectAnswer: true, playerWonGame: true)
                alertForThirdViewController(mainMessage: "Поздравляем!\n Вы заработали \(gameSession.moneyWon)$", secondMessage: "Это максимальный выиграш \n Игра окончена", answerCorrect: true, isLastQuistion: true, actionGame: "Начать с начала")
            }
            
        }
        else {
            if gameSession.numberOfRemainingQuestions-1 != 0 {
            gameSessionDelegate?.funcGameSessionDelegate(isCorrectAnswer: false, playerWonGame: false)
                alertForThirdViewController(mainMessage: "Вы проиграли!", secondMessage: "Правильный ответ: \n \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value-1].correctAnswer)", answerCorrect: false, isLastQuistion: false, actionGame: "Вернуться в меню")
            }
            else {
                gameSessionDelegate?.funcGameSessionDelegate(isCorrectAnswer: false, playerWonGame: false)
                alertForThirdViewController(mainMessage: "Вы проиграли! \n Это был последний вопрос", secondMessage: "Правильный ответ: \n \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value-1].correctAnswer)", answerCorrect: false, isLastQuistion: true, actionGame: "Начать с начала")
            }
        
        }
    }
    
    @IBAction func answerFirstAction(_ sender: Any) {
        checkResult(answer: answerFirst)
    }
    
    @IBAction func answerSecondAction(_ sender: Any) {
        checkResult(answer: answerSecond)
    }
    
    @IBAction func answerThirdAction(_ sender: Any) {
        checkResult(answer: answerThird)
    }
    
    @IBAction func answerFourthAction(_ sender: Any) {
        checkResult(answer: answerFourth)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Games.shared.allQuestions.count == 0 {
            builderQuestions.build()
        }
        Games.shared.allQuestions = orderQuestionsStrategy.orderQuestionsStrategy(allQuestions: Games.shared.allQuestions)
        cornerAndBorder()
        optimizationSizeSameView()
        addObserverForGame()
    }
    
    private func addObserverForGame(){
        Games.shared.gameSession?.numberOfNextQuestion.addObserver(self,options: [.initial, .new], closure: { [weak self] (numberNewQuestion, _) in
            guard let self = self else { return }
            if self.isChangeWithObserver {
                self.isChangeWithObserver = false
                self.changeWithObserver(numberNewQuestion: numberNewQuestion)
            }
            else { self.isChangeWithObserver = true }
        })
    }
  
    private func changeWithObserver(numberNewQuestion: Int){
        numberOfQuestionLabel.text = " \(numberNewQuestion+1)"
        let gameSession = Games.shared.gameSession!
        var percentOfCorrectAnswers = 100
        if gameSession.numberOfQuestionsAsked != 0 {
        percentOfCorrectAnswers = Int((Double(gameSession.allNumberOfCorrectAnswers)/Double(gameSession.numberOfQuestionsAsked))*100)
        }
        persentCurrentAnswersLabel.text = "\(percentOfCorrectAnswers)%"
    }
    
    private func cornerAndBorder(){
        
        guard let numberOfFirstQuestion = Games.shared.gameSession?.numberOfNextQuestion else {return}
        
        question.text = Games.shared.allQuestions[numberOfFirstQuestion.value].question
        questionBackground.layer.cornerRadius = 30*coefficientForChangeSizeConstrains
        questionBackground.layer.borderWidth = 3
        questionBackground.layer.borderColor = UIColor.black.cgColor
        
        answerFirst.setTitle("A: \(Games.shared.allQuestions[numberOfFirstQuestion.value].answerFirst)", for: [])
        answerFirst.layer.cornerRadius = 30
        answerFirst.layer.borderWidth = 3
        answerFirst.layer.borderColor = UIColor.black.cgColor
        
        answerSecond.setTitle("B: \(Games.shared.allQuestions[numberOfFirstQuestion.value].answerSecond)", for: [])
        answerSecond.layer.cornerRadius = 30
        answerSecond.layer.borderWidth = 3
        answerSecond.layer.borderColor = UIColor.black.cgColor
        
        answerThird.setTitle("C: \(Games.shared.allQuestions[numberOfFirstQuestion.value].answerThird)", for: [])
        answerThird.layer.cornerRadius = 30
        answerThird.layer.borderWidth = 3
        answerThird.layer.borderColor = UIColor.black.cgColor
        
        answerFourth.setTitle("D: \(Games.shared.allQuestions[numberOfFirstQuestion.value].answerFourth)", for: [])
        answerFourth.layer.cornerRadius = 30
        answerFourth.layer.borderWidth = 3
        answerFourth.layer.borderColor = UIColor.black.cgColor
        
        numberOfQuestionBackground.layer.cornerRadius = 10
        numberOfQuestionBackground.layer.borderWidth = 1
        numberOfQuestionBackground.layer.borderColor = UIColor.black.cgColor
        
        currentAnswersBackground.layer.cornerRadius = 10
        currentAnswersBackground.layer.borderWidth = 1
        currentAnswersBackground.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func alertForThirdViewController(mainMessage: String, secondMessage: String? = nil, answerCorrect: Bool, isLastQuistion: Bool, actionGame: String){
        guard let gameSession = Games.shared.gameSession else {return}
        let alertController = UIAlertController(title: mainMessage, message: secondMessage, preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: actionGame, style: .default) { [weak self] action in
            guard let self = self else {return}
            if answerCorrect && gameSession.numberOfRemainingQuestions != 0 {
                if self.isChangeWithObserver {
                    self.changeWithObserver(numberNewQuestion: Games.shared.gameSession!.numberOfNextQuestion.value)
                    self.isChangeWithObserver = false
                }
                self.question.text = Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].question
                self.answerFirst.setTitle("A: \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].answerFirst)", for: [])
                self.answerSecond.setTitle("B: \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].answerSecond)", for: [])
                self.answerThird.setTitle("C: \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].answerThird)", for: [])
                self.answerFourth.setTitle("D: \(Games.shared.allQuestions[gameSession.numberOfNextQuestion.value].answerFourth)", for: [])
            }
                else if !answerCorrect {
                    self.exitRestartAndContinueGames(answerCorrect:answerCorrect, isLastQuistion: isLastQuistion, isPressedExit: false)
                }
                    else {
                        self.exitRestartAndContinueGames(answerCorrect:answerCorrect, isLastQuistion: isLastQuistion, isPressedExit: false)
                    }
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Выйти из игры", style: .cancel) { [weak self] action in
            guard let self = self else {return}
            self.exitRestartAndContinueGames(answerCorrect:answerCorrect, isLastQuistion: isLastQuistion, isPressedExit: true)
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: {  })
    }

    private func exitRestartAndContinueGames(answerCorrect: Bool, isLastQuistion: Bool, isPressedExit: Bool){
        
        let gameSession = Games.shared.gameSession!
        var newResult = Results()
        newResult.moneyWon = Games.shared.gameSession!.moneyWon
        newResult.name = Games.shared.gameSession!.name
        if gameSession.numberOfQuestionsAsked != 0 {
            newResult.percentOfCorrectAnswers = Int((Double(gameSession.allNumberOfCorrectAnswers)/Double(gameSession.numberOfQuestionsAsked))*100)}
        else {newResult.percentOfCorrectAnswers = 0 }
        newResult.date = Date()
        
        Games.shared.results.append(newResult)
        dismiss(animated: false, completion: nil)
        if isLastQuistion || isPressedExit {
            Games.shared.gameSession = nil
            dismissDelegate?.funcDismissDelegate()
        }
    }
    
    private func optimizationSizeSameView() {
        let sizeCurrentConstrains = constrainHeightLogo.constant+constrainQuestion.constant
        let howManyHaveToChangeSize = CGFloat(sizeIphoneProMax)-view.frame.size.height
        coefficientForChangeSizeConstrains = (sizeCurrentConstrains-howManyHaveToChangeSize)/sizeCurrentConstrains
        constrainHeightLogo.constant = constrainHeightLogo.constant * coefficientForChangeSizeConstrains
        constrainQuestion.constant = constrainQuestion.constant * coefficientForChangeSizeConstrains
        constrainQuestionBackground.constant = constrainQuestionBackground.constant*coefficientForChangeSizeConstrains
        logoMillionaire.layer.cornerRadius = 90 * coefficientForChangeSizeConstrains
    }
}

