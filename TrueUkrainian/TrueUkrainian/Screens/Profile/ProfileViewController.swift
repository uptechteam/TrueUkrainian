//
//  ProfileViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Combine
import UIKit

protocol ProfileCoordinating: AnyObject {
    func didTapRating()
    func didTapDictionary()
    func didTapInfo()
}

public final class ProfileViewController: UIViewController {

    // MARK: - Properties

    private let store: Store
    private let actionCreator: ActionCreator
    private let contentView = ProfileView()
    private unowned let coordinator: ProfileCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(
        store: Store,
        actionCreator: ActionCreator,
        coordinator: ProfileCoordinating
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

    private func setupBinding() {
        contentView.onDidTabRatingButton = { [store] in
            store.dispatch(action: .ratingButtonTapped)
        }

        contentView.onDidTapDictionaryButton = { [store] in
            store.dispatch(action: .dictionaryButtonTapped)
        }

        contentView.ondidTapInfoButton = { [store] in
            store.dispatch(action: .infoButtonTapped)
        }

        let state = store.$state.removeDuplicates()
            .subscribe(on: DispatchQueue.main)

        state
            .map { state in
                return ProfileViewController.makeProps(from: state)
            }
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
        case .rating:
            coordinator.didTapRating()

        case .dictionary:
            coordinator.didTapDictionary()

        case .info:
            coordinator.didTapInfo()
        }
    }
}
