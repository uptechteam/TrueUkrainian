//
//  HomeCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class HomeCoordinator: Coordinating {

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
        let tabBarItem = UITabBarItem(
            title: nil, image: .homeDeselected, selectedImage: .homeSelected
        )
        tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        navigationController.tabBarItem = tabBarItem
    }

    // MARK: - Public methods

    func start() {
        let dependencies = HomeViewController.Dependencies()
        let viewController = HomeViewController(
            store: HomeViewController.makeStore(dependencies: dependencies),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension HomeCoordinator: HomeCoordinating {

}

