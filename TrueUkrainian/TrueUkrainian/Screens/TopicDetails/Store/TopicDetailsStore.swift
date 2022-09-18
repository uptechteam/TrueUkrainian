//
//  TopicDetailsStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension TopicDetailsViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        let category: Category
        let topic: Topic
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

    static func makeStore(dependencies: Dependencies, details: TopicDetails) -> Store {
        return Store(
            initialState: makeInitialState(dependencies: dependencies, details: details),
            reducer: reduce,
            middlewares: []
        )
    }

    private static func makeInitialState(dependencies: Dependencies, details: TopicDetails) -> State {
        return State(
            category: details.category,
            topic: details.topic,
            route: nil
        )
    }
}

extension TopicDetailsViewController {
    static func reduce(state: State, action: Action) -> State {

        let newState = state

        switch action {
        case .mock:
            break
        }

        return newState
    }
}
