//
//  CongratsViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Combine
import UIKit

protocol CongratsCoordinating: AnyObject {
    func didFinishCongrats()
    func didTapResults(activeQuiz: ActiveQuiz)
}

public final class CongratsViewController: UIViewController {

    // MARK: - Properties

    private let store: Store
    private let actionCreator: ActionCreator
    private let contentView = CongratsView()
    private unowned let coordinator: CongratsCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(
        store: Store,
        actionCreator: ActionCreator,
        coordinator: CongratsCoordinating
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
        navigationItem.backBarButtonItem = UIBarButtonItem(
            image: .back,
            style: .plain,
            target: nil,
            action: nil
        )
    }

    private func setupBinding() {
        contentView.onTapResults = { [store] in
            store.dispatch(action: .resultsTapped)
        }

        contentView.onTapShare = { [store] in
            store.dispatch(action: .shareTapped)
        }

        contentView.onTapHome = { [store] in
            store.dispatch(action: .homeTapped)
        }

        let state = store.$state.removeDuplicates()
            .subscribe(on: DispatchQueue.main)

        state
            .map(CongratsViewController.makeProps)
            .sink { [contentView] props in
                contentView.render(props: props)
            }
            .store(in: &cancellables)

        state.compactMap(\.alert).removeDuplicates()
            .map(\.value)
            .sink { [unowned self] alert in show(alert: alert) }
            .store(in: &cancellables)
        
        state.compactMap(\.route).removeDuplicates()
            .map(\.value)
            .sink { [unowned self] route in navigate(by: route) }
            .store(in: &cancellables)
    }

    private func show(alert: Alert) {
        switch alert {
        case .share:
            let alertViewController = UIAlertController(
                title: "Як поділитися",
                message: "1. Зроби скріншот свого результату.\n2. Поділись зі своїми друзями",
                preferredStyle: .alert
            )
            alertViewController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertViewController, animated: true)
        }
    }
    
    private func navigate(by route: Route) {
        switch route {
        case .finish:
            coordinator.didFinishCongrats()

        case .results(let quiz):
            coordinator.didTapResults(activeQuiz: quiz)
        }
    }
}
