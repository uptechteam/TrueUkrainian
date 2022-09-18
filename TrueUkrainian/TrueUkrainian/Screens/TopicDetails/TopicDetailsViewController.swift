//
//  TopicDetailsViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Combine
import UIKit

public protocol TopicDetailsCoordinating: AnyObject {

}

final class TopicDetailsViewController: UIViewController {

    // MARK: - Properties

    private let store: Store
    private let actionCreator: ActionCreator
    private let contentView = TopicDetailsView()
    private unowned let coordinator: TopicDetailsCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(
        store: Store,
        actionCreator: ActionCreator,
        coordinator: TopicDetailsCoordinating
    ) {
        self.store = store
        self.actionCreator = actionCreator
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
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
        navigationItem.title = "Назва"
    }

    private func setupBinding() {
        let state = store.$state.removeDuplicates()
            .subscribe(on: DispatchQueue.main)

        state.map(TopicDetailsViewController.makeProps)
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
            
        }
    }
}
