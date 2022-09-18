//
//  Quiz.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Foundation

struct Quiz: Equatable {
    let category: Category
    let questions: [Question]
}

struct Question: Equatable {
    let text: String
    let answers: [String]
    let correctAnswer: Int
    let correctAnswerDescription: String
}
