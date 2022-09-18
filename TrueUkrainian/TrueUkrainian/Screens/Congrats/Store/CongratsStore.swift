//
//  CongratsStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension CongratsViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        let activeQuiz: ActiveQuiz
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case homeTapped
    }

    enum Route {
        case finish
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

    static func makeInitialState(dependencies: Dependencies, activeQuiz: ActiveQuiz) -> State {
        return State(
            activeQuiz: activeQuiz,
            route: nil
        )
    }
}

extension CongratsViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .homeTapped:
            newState.route = .init(value: .finish)
        }

        return newState
    }
}
