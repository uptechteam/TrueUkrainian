//
//  ResultsProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension ResultsViewController {
    static func makeProps(from state: State) -> ResultsView.Props {
        return .init(
            title: "\(state.quiz.corectAnswers)/\(state.quiz.quiz.questions.count)",
            items: makeItems(state: state)
        )
    }

    private static func makeItems(state: State) -> [ResultsitemCell.Props] {
        return state.quiz.quiz.questions.enumerated().map { index, question in
            return .init(
                backColor: state.quiz.correctAnswersSet.contains(index) ? .white : .wrongAnswer,
                title: question.text,
                arrowImage: state.openedQuestions.contains(question.text) ? .arrowUp : .arrowDown,
                isDescVisible: state.openedQuestions.contains(question.text),
                desc: question.correctAnswerDescription
            )
        }
    }
}
