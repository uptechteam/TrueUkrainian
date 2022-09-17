//
//  TabBarCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class TabBarCoordinator: Coordinating {

    // MARK: - Properties

    private var childCoordinators: [Coordinating]
    private var tabBarController: UITabBarController

    var rootViewController: UIViewController {
        tabBarController
    }

    // MARK: - Lifecycle

    init() {
        self.childCoordinators = []
        self.tabBarController = UITabBarController()
        setupController()
    }

    // MARK: - Set up

    private func setupController() {
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.addShadow(
            color: UIColor.black.cgColor,
            opacitiy: 0.06,
            radius: 8,
            offset: CGSize(width: 0, height: -2)
        )
        tabBarController.tabBar.layer.roundCornersContinuosly(
            radius: 16,
            corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        )
    }

    // MARK: - Public methods

    func start() {
        makeKnowledgeCoordinator()
        makeHomeCoordinator()
        makeProfileCoordinator()
        childCoordinators.forEach { $0.start() }
        tabBarController.viewControllers = childCoordinators.map(\.rootViewController)
        tabBarController.selectedIndex = 1
    }

    // MARK: - Private methods

    private func makeKnowledgeCoordinator() {
        let coordinator = KnowledgeCoordinator(navigationController: BaseNavigationController())
        childCoordinators.append(coordinator)
    }

    private func makeHomeCoordinator() {
        let coordinator = HomeCoordinator(navigationController: BaseNavigationController())
        childCoordinators.append(coordinator)
    }

    private func makeProfileCoordinator() {
        let coordinator = ProfileCoordinator(navigationController: BaseNavigationController())
        childCoordinators.append(coordinator)
    }
}
