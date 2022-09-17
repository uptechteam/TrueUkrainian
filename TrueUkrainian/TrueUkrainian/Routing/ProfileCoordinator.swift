//
//  ProfileCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class ProfileCoordinator: Coordinating {

    // MARK: - Properties

    private var childCoordinators: [Coordinating] = []
    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    // MARK: - Lifecycle

    init(navigationController: UINavigationController) {
        self.childCoordinators = []
        self.navigationController = navigationController
        setupUI()
    }

    deinit {
        print("Deinit \(self)")
    }

    // MARK: - Set up

    private func setupUI() {
        navigationController.tabBarItem = UITabBarItem(
            title: "Профіль", image: nil, selectedImage: nil
        )
    }

    // MARK: - Public methods

    func start() {
        let dependencies = ProfileViewController.Dependencies()
        let viewController = ProfileViewController(
            store: ProfileViewController.makeStore(dependencies: dependencies),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension ProfileCoordinator: ProfileCoordinating {

}
