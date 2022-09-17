//
//  Redux.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Combine

@MainActor
public class ReduxStore<State, Action> {
    public typealias Reducer = @MainActor (State, Action) -> State
    public typealias Dispatch = (Action) async -> Void
    public typealias StateProvider = () -> State
    public typealias Middleware = (@escaping Dispatch, @escaping () -> State) -> (@escaping Dispatch) -> Dispatch

    @Published
    public var state: State
    private let reducer: Reducer
    private var dispatchFunction: Dispatch!

    public init(
        initialState: State,
        reducer: @escaping Reducer,
        middlewares: [Middleware]
    ) {
        self.state = initialState
        self.reducer = reducer
        let defaultDispatch: Dispatch = { [unowned self] action in
            state = reducer(state, action)
        }
        self.dispatchFunction = middlewares
            .reversed()
            .reduce(defaultDispatch) { dispatchFunction, middleware -> Dispatch in
                let dispatch: Dispatch = { [weak self] in self?.dispatch(action: $0) }
                let getState: StateProvider = { [weak self] in self?.state ?? initialState }
                return middleware(dispatch, getState)(dispatchFunction)
            }
    }

    nonisolated public func dispatch(action: Action) {
        Task { @MainActor in
            await dispatchFunction?(action)
        }
    }

    public static func makeMiddleware(
        worker: @escaping (@escaping Dispatch, StateProvider, Dispatch, Action) async -> Void
    ) -> Middleware {
        return { dispatch, getState in { next in { action in await worker(dispatch, getState, next, action) } } }
    }
}

extension ReduxStore {
    public static func combine(_ reducers: [Reducer]) -> Reducer {
        return { state, action in
            reducers.reduce(state, { state, reducer in reducer(state, action) })
        }
    }

    public static func map<ChildState>(
        _ reducer: @escaping @MainActor (ChildState, Action) -> ChildState,
        _ keyPath: WritableKeyPath<State, ChildState>
    ) -> @MainActor (State, Action) -> State {
        return { state, action in
            let newChildState = reducer(state[keyPath: keyPath], action)
            var newState = state
            newState[keyPath: keyPath] = newChildState
            return newState
        }
    }
}

