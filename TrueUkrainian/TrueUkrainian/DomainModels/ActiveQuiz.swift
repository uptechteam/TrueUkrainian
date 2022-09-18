//
//  ActiveQuiz.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Foundation

struct ActiveQuiz: Equatable {
    var index: Int
    var correctAnswersSet: Set<Int>
    let quiz: Quiz

    var corectAnswers: Int {
        return correctAnswersSet.count
    }
}
