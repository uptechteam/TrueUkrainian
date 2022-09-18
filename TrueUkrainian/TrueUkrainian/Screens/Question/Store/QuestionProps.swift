//
//  QuestionProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension QuestionViewController {
    static func makeProps(from state: State) -> QuestionView.Props {
        let questionIndex = state.activeQuiz.index
        let questions = state.activeQuiz.quiz.questions
        return .init(
            progress: 0.5,
            category: makeCategoryText(category: state.activeQuiz.quiz.category),
            counterText: "\(questionIndex + 1)/\(questions.count)",
            questionBackColor: state.activeQuiz.quiz.category.mainColor,
            question: questions[questionIndex].text,
            answerOneViewProps: makeAnswerProps(state: state, index: 0),
            answerTwoViewProps: makeAnswerProps(state: state, index: 1),
            answerThreeViewProps: makeAnswerProps(state: state, index: 2),
            answerFourViewProps: makeAnswerProps(state: state, index: 3),
            buttonTitle: "Обери відповідь"
        )
    }

    private static func makeCategoryText(category: Category) -> String {
        switch category {
        case .country:
            return "Держава"

        case .history:
            return "Історія України"

        case .culture:
            return "Культура України"
        }
    }

    static func makeAnswerProps(state: State, index: Int) -> QuestionAnswerView.Props {
        let question = state.activeQuiz.quiz.questions[state.activeQuiz.index]
        return .init(
            backColor: .white,
            text: question.answers[index]
        )
    }
}
