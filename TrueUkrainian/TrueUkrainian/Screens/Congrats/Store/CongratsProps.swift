//
//  CongratsProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension CongratsViewController {
    static func makeProps(from state: State) -> CongratsView.Props {
        let corectAnswers = state.activeQuiz.corectAnswers
        return .init(
            backColor: state.activeQuiz.quiz.category.mainColor,
            pointsText: "Ти отримав \(corectAnswers * 100) балів!",
            correctAnswerText: "\(corectAnswers)/\(state.activeQuiz.quiz.questions.count)",
            progressViewProps: makeProgressViewProps(state: state)
        )
    }

    private static func makeProgressViewProps(state: State) -> CongratsProgressView.Props {
        return .init(
            ratingName: "Селянин",
            progress: 0.55,
            minPoints: "0",
            points: "1290",
            maxPoints: "2500"
        )
    }
}
