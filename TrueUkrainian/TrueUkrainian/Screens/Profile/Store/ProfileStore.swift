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
        case ratingButtonTapped
        case dictionaryButtonTapped
        case infoButtonTapped
    }

    enum Route {
        case rating
        case dictionary
        case info
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

        var newState = state

        switch action {
        case .ratingButtonTapped:
            newState.route = .init(value: .rating)

        case .dictionaryButtonTapped:
            newState.route = .init(value: .dictionary)

        case.infoButtonTapped:
            newState.route = .init(value: .info)
        }

        return newState
    }
}
