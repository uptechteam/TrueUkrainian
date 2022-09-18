//
//  QuestionViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Combine
import UIKit

protocol QuestionCoordinating: AnyObject {
    func didTapCloseQuiz()
    func didFinishQuiz(activeQuiz: ActiveQuiz)
    func didProceedNext(activeQuiz: ActiveQuiz)
}

public final class QuestionViewController: UIViewController {

    // MARK: - Properties

    private let store: Store
    private let actionCreator: ActionCreator
    private let contentView = QuestionView()
    private unowned let coordinator: QuestionCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(
        store: Store,
        actionCreator: ActionCreator,
        coordinator: QuestionCoordinating
    ) {
        self.store = store
        self.actionCreator = actionCreator
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Deinit \(self)")
    }

    public override func loadView() {
        view = contentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    // MARK: - Private methods

    private func setupUI() {
        hidesBottomBarWhenPushed = true
    }

    private func setupBinding() {
        contentView.onTapAnswer = { [store] index in
            store.dispatch(action: .answerTapped(index))
        }

        contentView.onTapAction = { [store] in
            store.dispatch(action: .actionTapped)
        }

        contentView.onTapClose = { [store] in
            store.dispatch(action: .closeTapped)
        }

        let state = store.$state.removeDuplicates()
            .subscribe(on: DispatchQueue.main)

        state
            .map(QuestionViewController.makeProps)
            .sink { [contentView] props in
                contentView.render(props: props)
            }
            .store(in: &cancellables)
        
        state.compactMap(\.route).removeDuplicates()
            .map(\.value)
            .sink { [unowned self] route in navigate(by: route) }
            .store(in: &cancellables)
    }
    
    private func navigate(by route: Route) {
        switch route {
        case .close:
            coordinator.didTapCloseQuiz()

        case .nextQuestion(let quiz):
            coordinator.didProceedNext(activeQuiz: quiz)

        case .finish(let quiz):
            coordinator.didFinishQuiz(activeQuiz: quiz)
        }
    }
}
