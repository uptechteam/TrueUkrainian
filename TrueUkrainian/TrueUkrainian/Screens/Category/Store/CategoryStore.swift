//
//  CategoryStore.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension CategoryViewController {

    typealias Store = ReduxStore<State, Action>

    struct State: Equatable {
        let category: Category
        var route: AnyIdentifiable<Route>?
    }

    enum Action {
        case startTapped
    }

    enum Route {
        case startQuiz(Category)
    }

    struct Dependencies {
        public init() {

        }
    }

    static func makeStore(dependencies: Dependencies, category: Category) -> Store {
        return Store(
            initialState: makeInitialState(dependencies: dependencies, category: category),
            reducer: reduce,
            middlewares: []
        )
    }

    private static func makeInitialState(dependencies: Dependencies, category: Category) -> State {
        return State(
            category: category,
            route: nil
        )
    }
}

extension CategoryViewController {
    static func reduce(state: State, action: Action) -> State {

        var newState = state

        switch action {
        case .startTapped:
            newState.route = .init(value: .startQuiz(newState.category))
        }

        return newState
    }
}
