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
                    text: "Якого князя називали “тестем Європи”?",
                    answers: [
                        "Ярослав",
                        "Володимир",
                        "Святослав",
                        "Ігор"
                    ],
                    correctAnswer: 0,
                    correctAnswerDescription: """
Великим київським князем став Ярослав Володимирович,  який правив з 1019 року по 1054рік. Його прозвали за розум і вченість Мудрим. Але не тільки таке прізвисько мав Ярослав Володимирович. За свою зовнішньополітичну активність та зв’язки його ще називали тестем Європи.
"""
                ),
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
                    text: "Перші письмові згадки про козаків датуються яким роком?",
                    answers: [
                        "1488 рік",
                        "1369 рік",
                        "1489 рік",
                        "1562 рік"
                    ],
                    correctAnswer: 2,
                    correctAnswerDescription: """
Перша в історії офіційна згадка про дії козаків на морі й офіційна згадка про запорозьких козаківа узагалі - 1489 рік у "Хроніці Польській"
"""
                ),
                Question(
                    text: "Яку назву мала Українська козацька держава?",
                    answers: [
                        "Військо Запорозьке",
                        "Запорізька Україна",
                        "Русь Україна",
                        "Україна"
                    ],
                    correctAnswer: 0,
                    correctAnswerDescription: """
Гетьманщина, Перший Гетьманат або Військо Запорозьке
"""
                ),
                Question(
                    text: "До Троїстого союзу належали?",
                    answers: [
                        "Німеччина, Асвтро-Угорська та Британська імперія",
                        "Австро-Угорщина, Італія та Російська імперія",
                        "Австро-Угорщина, Німеччина та Російська імперія",
                        "Німеччина, Австро-Угорщина та Італія"
                    ],
                    correctAnswer: 3,
                    correctAnswerDescription: """
Троїстий союз — військово-політичний блок Німецької імперії, Австро-Угорської імперії та Королівства Італія, який склався в 1879–1882 і був спрямований проти Французької республіки, Російської імперії та Великої Британії.
"""
                )
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
