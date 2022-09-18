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
                    correctAnswerDescription: "Ярослав"
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
