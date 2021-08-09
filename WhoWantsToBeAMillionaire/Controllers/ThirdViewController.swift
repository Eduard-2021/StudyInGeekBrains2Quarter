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

class ThirdViewController: UIViewController {
    
    var allQuetions = [Question]()
    var gameSessionDelegate: GameSessionDelegate?
    var dismissDelegate: DismissDelegete?
    var numberOfCurrentAnswers = 0
    var numberQuestion = 0

    @IBOutlet weak var logoMillionaire: UIImageView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionBackground: UILabel!
    @IBOutlet weak var answerFirst: UIButton!
    @IBOutlet weak var answerSecond: UIButton!
    @IBOutlet weak var answerThird: UIButton!
    @IBOutlet weak var answerFourth: UIButton!
    
    private func checkResult(answer:UIButton!){
        guard let gameSession = Games.shared.gameSession else {return}
        guard var answerNew = answer.titleLabel?.text else {return}
        answerNew.removeFirst(3)
        if answerNew == allQuetions[gameSession.numberOfNextQuestion].correctAnswer {
            
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
            alertForThirdViewController(mainMessage: "Вы проиграли!", secondMessage: "Правильный ответ: \n \(allQuetions[gameSession.numberOfNextQuestion-1].correctAnswer)", answerCorrect: false, isLastQuistion: false, actionGame: "Вернуться в меню")
            }
            else {
                gameSessionDelegate?.funcGameSessionDelegate(isCorrectAnswer: false, playerWonGame: false)
                alertForThirdViewController(mainMessage: "Вы проиграли! \n Это был последний вопрос", secondMessage: "Правильный ответ: \n \(allQuetions[gameSession.numberOfNextQuestion-1].correctAnswer)", answerCorrect: false, isLastQuistion: true, actionGame: "Начать с начала")
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
        loadQuetions()
        cornerAndBorder()
        
    }
    
    private func loadQuetions(){
        
        var questionAndAnswer = Question()
        questionAndAnswer.question = "В каком языке до 1945 года употреблялась буква 'ять'?\n(Болгарский)"
        questionAndAnswer.answerFirst = "Белорусский"
        questionAndAnswer.answerSecond = "Болгарский"
        questionAndAnswer.answerThird = "Молдавский"
        questionAndAnswer.answerFourth = "Словацкий"
        questionAndAnswer.correctAnswer = "Болгарский"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "В честь какого животного получил прозвище рок-музыкант Дэвид Боуи?\n(Хамелеон)"
        questionAndAnswer.answerFirst = "Страус"
        questionAndAnswer.answerSecond = "Хамелеон"
        questionAndAnswer.answerThird = "Летучая мышь"
        questionAndAnswer.answerFourth = "Волк"
        questionAndAnswer.correctAnswer = "Хамелеон"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Какой химический элемент в западной алхимии соответствовал планете Венере?\n(Медь)"
        questionAndAnswer.answerFirst = "Железо"
        questionAndAnswer.answerSecond = "Серебро"
        questionAndAnswer.answerThird = "Олово"
        questionAndAnswer.answerFourth = "Медь"
        questionAndAnswer.correctAnswer = "Медь"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Что героиня сериала 'Ход королевы' впервые в жизни увидела на официальном турнире?\n(Шахматные часы)"
        questionAndAnswer.answerFirst = "Шахматную доску"
        questionAndAnswer.answerSecond = "Шахматные фигуры"
        questionAndAnswer.answerThird = "Шахматный учебник"
        questionAndAnswer.answerFourth = "Шахматные часы"
        questionAndAnswer.correctAnswer = "Шахматные часы"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Какое латиноамериканское государство владеет островом Робинзона Крузо?\n(Чили)"
        questionAndAnswer.answerFirst = "Перу"
        questionAndAnswer.answerSecond = "Коста-Рика"
        questionAndAnswer.answerThird = "Чили"
        questionAndAnswer.answerFourth = "Панама"
        questionAndAnswer.correctAnswer = "Чили"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Какая из этих птиц летающая?\n(Гага)"
        questionAndAnswer.answerFirst = "Киви"
        questionAndAnswer.answerSecond = "Эму"
        questionAndAnswer.answerThird = "Нанду"
        questionAndAnswer.answerFourth = "Гага"
        questionAndAnswer.correctAnswer = "Гага"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Название какого дня недели буквально переводится на японский как 'день луны'?\n(Понедельник)"
        questionAndAnswer.answerFirst = "Понедельник"
        questionAndAnswer.answerSecond = "Пятница"
        questionAndAnswer.answerThird = "Суббота"
        questionAndAnswer.answerFourth = "Воскресенье"
        questionAndAnswer.correctAnswer = "Понедельник"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "В какой стране продажа алкоголя разрешена только в отелях на отдельных островах?\n(Мальдивы)"
        questionAndAnswer.answerFirst = "Маррокко"
        questionAndAnswer.answerSecond = "ОАЭ"
        questionAndAnswer.answerThird = "Мальдивы"
        questionAndAnswer.answerFourth = "Индонезия"
        questionAndAnswer.correctAnswer = "Мальдивы"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Что в записи шахматных партий обозначает знак «+»?\n(Шах)"
        questionAndAnswer.answerFirst = "Шах"
        questionAndAnswer.answerSecond = "Мат"
        questionAndAnswer.answerThird = "Ничью"
        questionAndAnswer.answerFourth = "Рокировку"
        questionAndAnswer.correctAnswer = "Шах"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Производство чего наладил в Камбодже студент Самир Лакхани, собирающий сырье в 170 отелях?\n(Мыла)"
        questionAndAnswer.answerFirst = "Париков"
        questionAndAnswer.answerSecond = "Пластиковой посуды"
        questionAndAnswer.answerThird = "Кошачего корма"
        questionAndAnswer.answerFourth = "Мыла"
        questionAndAnswer.correctAnswer = "Мыла"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Что дарят своим подругам расписные малюры?\n(Лепестки цветов)"
        questionAndAnswer.answerFirst = "Рыбу"
        questionAndAnswer.answerSecond = "Камни"
        questionAndAnswer.answerThird = "Бабочек"
        questionAndAnswer.answerFourth = "Лепестки цветов"
        questionAndAnswer.correctAnswer = "Лепестки цветов"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Что держали в находящихся в пекинском Запретном городе чанах?\n(Воду)"
        questionAndAnswer.answerFirst = "Воду"
        questionAndAnswer.answerSecond = "Землю"
        questionAndAnswer.answerThird = "Рис"
        questionAndAnswer.answerFourth = "Хризантемы"
        questionAndAnswer.correctAnswer = "Воду"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Идею какого произведения Льву Толстому подсказал Анатолий Кони?\n(Воскресение)"
        questionAndAnswer.answerFirst = "Анна Каренина"
        questionAndAnswer.answerSecond = "Живой труп"
        questionAndAnswer.answerThird = "Казаки"
        questionAndAnswer.answerFourth = "Воскресение"
        questionAndAnswer.correctAnswer = "Воскресение"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "Какое оружие главное для индийского бога Камы?\n(Лук)"
        questionAndAnswer.answerFirst = "Меч"
        questionAndAnswer.answerSecond = "Копье"
        questionAndAnswer.answerThird = "Праща"
        questionAndAnswer.answerFourth = "Лук"
        questionAndAnswer.correctAnswer = "Лук"
        allQuetions.append(questionAndAnswer)
        
        questionAndAnswer.question = "В какой стране никогда не находился географический центр Евросоюза?\n(Австрия)"
        questionAndAnswer.answerFirst = "Франция"
        questionAndAnswer.answerSecond = "Бельгия"
        questionAndAnswer.answerThird = "Германия"
        questionAndAnswer.answerFourth = "Австрия"
        questionAndAnswer.correctAnswer = "Австрия"
        allQuetions.append(questionAndAnswer)
        
    }
    
    private func cornerAndBorder(){
        logoMillionaire.layer.cornerRadius = 90
        guard let numberOfFirstQuestion = Games.shared.gameSession?.numberOfNextQuestion else {return}
        
        
        numberQuestion = numberOfFirstQuestion
        
        question.text = allQuetions[numberOfFirstQuestion].question
        questionBackground.layer.cornerRadius = 30
        questionBackground.layer.borderWidth = 3
        questionBackground.layer.borderColor = UIColor.black.cgColor
        
        answerFirst.setTitle("A: \(allQuetions[numberOfFirstQuestion].answerFirst)", for: [])
        answerFirst.layer.cornerRadius = 30
        answerFirst.layer.borderWidth = 3
        answerFirst.layer.borderColor = UIColor.black.cgColor
        
        answerSecond.setTitle("B: \(allQuetions[numberOfFirstQuestion].answerSecond)", for: [])
        answerSecond.layer.cornerRadius = 30
        answerSecond.layer.borderWidth = 3
        answerSecond.layer.borderColor = UIColor.black.cgColor
        
        answerThird.setTitle("C: \(allQuetions[numberOfFirstQuestion].answerThird)", for: [])
        answerThird.layer.cornerRadius = 30
        answerThird.layer.borderWidth = 3
        answerThird.layer.borderColor = UIColor.black.cgColor
        
        answerFourth.setTitle("D: \(allQuetions[numberOfFirstQuestion].answerFourth)", for: [])
        answerFourth.layer.cornerRadius = 30
        answerFourth.layer.borderWidth = 3
        answerFourth.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func alertForThirdViewController(mainMessage: String, secondMessage: String? = nil, answerCorrect: Bool, isLastQuistion: Bool, actionGame: String){
        guard let gameSession = Games.shared.gameSession else {return}
        let alertController = UIAlertController(title: mainMessage, message: secondMessage, preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: actionGame, style: .default) { [weak self] action in
            guard let self = self else {return}
            if answerCorrect && gameSession.numberOfRemainingQuestions != 0 {
                self.question.text = self.allQuetions[gameSession.numberOfNextQuestion].question
                self.answerFirst.setTitle("A: \(self.allQuetions[gameSession.numberOfNextQuestion].answerFirst)", for: [])
                self.answerSecond.setTitle("B: \(self.allQuetions[gameSession.numberOfNextQuestion].answerSecond)", for: [])
                self.answerThird.setTitle("C: \(self.allQuetions[gameSession.numberOfNextQuestion].answerThird)", for: [])
                self.answerFourth.setTitle("D: \(self.allQuetions[gameSession.numberOfNextQuestion].answerFourth)", for: [])
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
        var numberOfCorrectAnswers = 0
        var numberOfQuestions = 0
        
        if answerCorrect && isPressedExit {
            gameSession.arrayOfNumberCurrectAnswers.append((gameSession.numberOfCorrectAnswers,gameSession.numberOfQuestionsAsked))
        }
        
        for value in Games.shared.gameSession!.arrayOfNumberCurrectAnswers {
            numberOfCorrectAnswers = numberOfCorrectAnswers + value.0
            numberOfQuestions = numberOfQuestions + value.1
        }
        var newResult = Results()
        newResult.moneyWon = Games.shared.gameSession!.moneyWon
        newResult.name = Games.shared.gameSession!.name
        if numberOfQuestions != 0 {
            newResult.percentOfCorrectAnswers = Int((Double(numberOfCorrectAnswers)/Double(numberOfQuestions))*100)}
        else {newResult.percentOfCorrectAnswers = 0 }
        newResult.date = Date()
        
        Games.shared.results.append(newResult)
        dismiss(animated: false, completion: nil)
        if isLastQuistion || isPressedExit {
            Games.shared.gameSession = nil
            dismissDelegate?.funcDismissDelegate()
        }
    }
}

