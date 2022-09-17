//
//  ProfileStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension ProfileViewController {

    public typealias Store = ReduxStore<State, Action>

    public struct State: Equatable {
        var route: AnyIdentifiable<Route>?
    }

    public enum Action {
        case mock
    }

    enum Route {

    }

    public struct Dependencies {
        public init() {

        }
    }

    public static func makeStore(dependencies: Dependencies) -> Store {
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

extension ProfileViewController {
    static func reduce(state: State, action: Action) -> State {

        let newState = state

        switch action {
        case .mock:
            break
        }

        return newState
    }
}
