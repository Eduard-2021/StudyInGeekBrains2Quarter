//
//  LoadData.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 10.08.2021.
//

import UIKit

class LoadData {
    
     func loadQuetions() -> [Question] {
        var allQuetions = [Question]()
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
        
        return allQuetions
        
    }
}
