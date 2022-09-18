//
//  KnowledgeCategoryStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Foundation

extension KnowledgeCategoryViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        let category: Category
        let topics: [Topic]
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case itemTapped(IndexPath)
    }

    enum Route {
        case showTopic(TopicDetails)
    }

    public struct Dependencies {
        public init() {

        }
    }

    static func makeStore(dependencies: Dependencies, details: TopicsDetails) -> Store {
        return Store(
            initialState: makeInitialState(dependencies: dependencies, details: details),
            reducer: reduce,
            middlewares: []
        )
    }

    private static func makeInitialState(dependencies: Dependencies, details: TopicsDetails) -> State {
        return State(
            category: details.category,
            topics: details.topics,
            route: nil
        )
    }
}

extension KnowledgeCategoryViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .itemTapped(let indexPath):
            let topic = newState.topics[indexPath.item]
            newState.route = .init(value: .showTopic(TopicDetails(category: newState.category, topic: topic)))
        }

        return newState
    }
}
