//
//  QuizProvider.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Foundation

final class QuizProvider {

    func getQuiz(category: Category) -> Quiz {
        switch category {
        case .country:
            return getCountryQuiz()

        case .history:
            return getHistoryQuiz()

        case .culture:
            return getCultureQuiz()
        }
    }

    private func getCountryQuiz() -> Quiz {
        return Quiz(
            category: .country,
            questions: [
                Question(
                    text: "Питання 1",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 0,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 2",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 1,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 3",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 2,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 4",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 3,
                    correctAnswerDescription: "Пояснення"
                )
            ]
        )
    }

    private func getHistoryQuiz() -> Quiz {
        return Quiz(
            category: .history,
            questions: [
                Question(
                    text: "Коли була перша згадка про Україну?",
                    answers: [
                        "1169 рік",
                        "1187 рік",
                        "1037 рік",
                        "1239 рік"
                    ],
                    correctAnswer: 1,
                    correctAnswerDescription: """
Україна вперше згадується в Київському літописі під 1187 роком, у зв'язку зі смертю переяславського князя Володимира Глібовича на Посульському рубежі
"""
                ),
                Question(
                    text: "Хто здійснював функції гетьманьского уряду, призначенням якого було \"об'єднання праці окремих відомств\" у сфері законодавчої та виконавчої діяльності в період існування Української держави?",
                    answers: [
                        "Коллегія Верховних Правителів",
                        "Рада міністрів",
                        "Мала рада міністрів",
                        "Інститут державної служби"
                    ],
                    correctAnswer: 1,
                    correctAnswerDescription: """
Рада міністрів здійснювала функції гетьманського уряду.
У складі Ради міністрів виділялися міністерства внутрішніх справ, фінансів, торгівлі і промисловості, земельних справ, судових справ, iноземних справ, військове міністерство та iн. Пізніше з'явилися також міністерство народного здоров'я та міністерство сповідань, яке займалося релігійними проблемами. Міністерства здебільшого поділялися на департаменти і управління.
"""
                ),
                Question(
                    text: "Чим займалась організація місцевої влади в період існування Української держави?",
                    answers: [
                        "Заміна ЦР комісарів на губернські і повітові старости",
                        "Уводилася куріальна система(залежно від суми земського податку)",
                        "Об'єднювала працю окремих відомств держави",
                        "Затверджувала закони на державному рівні"
                    ],
                    correctAnswer: 3,
                    correctAnswerDescription: """
Організація місцевої влади у період Гетьманату будувалася на тому, що призначені ЦР комісари були усунуті зі своїх посад, а їх замінили губернські і повітові старости, які очолили місцеві адміністрації та були підпорядковані міністерству внутрішніх справ. За своїм статусом губернські старости майже повністю відповідали колишнім російським губернаторам.

"""
                ),
                Question(
                    text: "Чого не робила Гетьманьска Влада?",
                    answers: [
                        "Поновлення у повній мірі права приватної власності",
                        "Тверде забезпечення прав робітничого класу",
                        "Поновлення повної свободи торгівлі",
                        "Налаштування торговлі з сусідніми державами"
                    ],
                    correctAnswer: 3,
                    correctAnswerDescription: """
У своїй законодавчій діяльності гетьманська влада виходила з того, що залишала чинними ті нормативно-правові акти Російської імперії та Центральної Ради, які не суперечили її iнтересам.

Серед основних законодавчих нововведень, які пропонував П. Скоропадський, були такі:
1. Поновлення у повній мірі права приватної власності;
2. Скасування всіх розпоряджень Генерального Секретаріату ЦР і Тимчасового Уряду Росії;
3. Вилучення у великих землевласників земель за їх дійсною вартістю для наділення земельними ділянками малоземельних селян;
4. Тверде забезпечення прав робітничого класу;
5. Поновлення повної свободи торгівлі;
6. Відкриття широкого простору приватному підприємництву.
"""
                ),
                Question(
                    text: "Якого князя називали “тестем Європи”?",
                    answers: [
                        "Ярослав",
                        "Володимир",
                        "Святослав",
                        "Ігор"
                    ],
                    correctAnswer: 0,
                    correctAnswerDescription: "Ярослав"
                ),
            ]
        )
    }



    private func getCultureQuiz() -> Quiz {
        return Quiz(
            category: .culture,
            questions: [
                Question(
                    text: "Питання 1",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 0,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 2",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 1,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 3",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 2,
                    correctAnswerDescription: "Пояснення"
                ),
                Question(
                    text: "Питання 4",
                    answers: ["Варіант 1", "Варіант 2", "Варіант 3", "Варіант 4"],
                    correctAnswer: 3,
                    correctAnswerDescription: "Пояснення"
                )
            ]
        )
    }
}
