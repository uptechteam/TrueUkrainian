//
//  QuestionStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension QuestionViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case closeTapped
    }

    enum Route {
        case finish
    }

    struct Dependencies {
        public init() {

        }
    }

    static func makeStore(dependencies: Dependencies) -> Store {
        return Store(
            initialState: makeInitialState(dependencies: dependencies),
            reducer: reduce,
            middlewares: []
        )
    }

    private static func makeInitialState(dependencies: Dependencies) -> State {
        return State(
            route: nil
        )
    }
}

extension QuestionViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .closeTapped:
            newState.route = .init(value: .finish)
        }

        return newState
    }
}
