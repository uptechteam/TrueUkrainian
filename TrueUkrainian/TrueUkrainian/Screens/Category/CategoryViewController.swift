//
//  CategoryViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Combine
import UIKit

protocol CategoryCoordinating: AnyObject {
    func didTapStartQuiz(category: Category)
}

final class CategoryViewController: UIViewController {

    // MARK: - Properties

    private let store: Store
    private let actionCreator: ActionCreator
    private let contentView = CategoryView()
    private unowned let coordinator: CategoryCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(
        store: Store,
        actionCreator: ActionCreator,
        coordinator: CategoryCoordinating
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
        navigationItem.title = "Назва"
    }

    private func setupBinding() {
        contentView.onTapStart = { [store] in
            store.dispatch(action: .startTapped)
        }

        let state = store.$state.removeDuplicates()
            .subscribe(on: DispatchQueue.main)

        state
            .map(CategoryViewController.makeProps)
            .sink { [contentView] props in
                contentView.render(props: props)
            }
            .store(in: &cancellables)

        state
            .first()
            .sink { [unowned self] state in
                switch state.category {
                case .country:
                    navigationItem.title = "Держава"

                case .history:
                    navigationItem.title = "Історія України"

                case .culture:
                    navigationItem.title = "Культура України"
                }
            }
            .store(in: &cancellables)
        
        state.compactMap(\.route).removeDuplicates()
            .map(\.value)
            .sink { [unowned self] route in navigate(by: route) }
            .store(in: &cancellables)
    }
    
    private func navigate(by route: Route) {
        switch route {
        case .startQuiz(let category):
            coordinator.didTapStartQuiz(category: category)
        }
    }
}
