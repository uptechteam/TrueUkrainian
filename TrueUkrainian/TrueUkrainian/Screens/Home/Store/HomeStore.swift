//
//  HomeStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension HomeViewController {

    typealias Store = ReduxStore<State, Action>

    public struct State: Equatable {
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case categoryTapped(Category)
    }

    enum Route {
        case showCategory(Category)
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

extension HomeViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .categoryTapped(let category):
            newState.route = .init(value: .showCategory(category))
        }

        return newState
    }
}
