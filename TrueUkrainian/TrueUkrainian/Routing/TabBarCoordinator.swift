//
//  TabBarCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

protocol TabBarCoordinatorDelegate: AnyObject {

}

final class TabBarCoordinator: Coordinating {

    // MARK: - Properties

    private var childCoordinators: [Coordinating]
    private var tabBarController: UITabBarController
    weak var delegate: TabBarCoordinatorDelegate?

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

    }

    // MARK: - Public methods

    func start() {
        makeKnowledgeCoordinator()
        makeHomeCoordinator()
        makeProfileCoordinator()
        childCoordinators.forEach { $0.start() }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        tabBarController.viewControllers = [viewController]
        tabBarController.selectedIndex = 0
    }

    // MARK: - Private methods

    private func makeKnowledgeCoordinator() {
//        let coordinator = HomeCoordinator(container: container, navigationController: BaseNavigationController())
//        childCoordinators.append(coordinator)
    }

    private func makeHomeCoordinator() {
//        let coordinator = MessagesCoordinator(container: container, navigationController: BaseNavigationController())
//        childCoordinators.append(coordinator)
    }

    private func makeProfileCoordinator() {
//        let coordinator = ProfileCoordinator(container: container, navigationController: BaseNavigationController())
//        coordinator.delegate = self
//        childCoordinators.append(coordinator)
    }
}
