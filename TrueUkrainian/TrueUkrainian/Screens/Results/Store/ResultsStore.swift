//
//  ResultsStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Foundation

extension ResultsViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        var openedQuestions: Set<String>
        let quiz: ActiveQuiz
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case itemTapped(IndexPath)
    }

    enum Route {

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
            openedQuestions: Set(),
            quiz: activeQuiz,
            route: nil
        )
    }
}

extension ResultsViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .itemTapped(let indexPath):
            let question = newState.quiz.quiz.questions[indexPath.item]
            if newState.openedQuestions.contains(question.text) {
                newState.openedQuestions.remove(question.text)
            } else {
                newState.openedQuestions.insert(question.text)
            }
        }

        return newState
    }
}
