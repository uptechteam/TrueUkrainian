//
//  QuestionStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension QuestionViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        var activeQuiz: ActiveQuiz
        var answer: Int
        var isAnswered: Bool
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case actionTapped
        case answerTapped(Int)
        case closeTapped
    }

    enum Route {
        case close
        case finish(ActiveQuiz)
        case nextQuestion(ActiveQuiz)
    }

    struct Dependencies {
        public init() {

        }
    }

    static func makeStore(dependencies: Dependencies, activeQuiz: ActiveQuiz) -> Store {
        return Store(
            initialState: makeInitialState(dependencies: dependencies, activeQuiz: activeQuiz),
            reducer: reduce,
            middlewares: []
        )
    }

    private static func makeInitialState(dependencies: Dependencies, activeQuiz: ActiveQuiz) -> State {
        return State(
            activeQuiz: activeQuiz,
            answer: 0,
            isAnswered: false,
            route: nil
        )
    }
}

extension QuestionViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .actionTapped:
            if newState.activeQuiz.index == newState.activeQuiz.quiz.questions.count - 1 {
                newState.route = .init(value: .finish(newState.activeQuiz))
            } else {
                newState.route = .init(value: .nextQuestion(newState.activeQuiz))
            }

        case .answerTapped(let index):
            guard !newState.isAnswered else {
                break
            }

            newState.isAnswered = true
            newState.answer = index
            if newState.activeQuiz.quiz.questions[newState.activeQuiz.index].correctAnswer == index {
                newState.activeQuiz.corectAnswers += 1
            }

        case .closeTapped:
            newState.route = .init(value: .close)
        }

        return newState
    }
}
