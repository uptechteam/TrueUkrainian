//
//  ResultsStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension ResultsViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case mock
    }

    enum Route {

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

extension ResultsViewController {
    static func reduce(state: State, action: Action) -> State {

        let newState = state

        switch action {
        case .mock:
            break
        }

        return newState
    }
}
