//
//  QuestionProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension QuestionViewController {
    static func makeProps(from state: State) -> QuestionView.Props {
        return .init(
            progress: 0.5,
            category: "Історія України",
            counterText: "2/2",
            questionBackColor: Category.history.mainColor,
            question: "Коли була перша згадка про Україну?",
            answerOneViewProps: makeAnswerProps(state: state, index: 0),
            answerTwoViewProps: makeAnswerProps(state: state, index: 1),
            answerThreeViewProps: makeAnswerProps(state: state, index: 2),
            answerFourViewProps: makeAnswerProps(state: state, index: 3),
            buttonTitle: "Обери відповідь"
        )
    }

    static func makeAnswerProps(state: State, index: Int) -> QuestionAnswerView.Props {
        return .init(
            backColor: .white,
            text: "Відповідь"
        )
    }
}
