//
//  AppCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

public final class AppCoordinator {

    // MARK: - Properties

    private var childCoordinators: [Coordinating]
    private let window: UIWindow

    // MARK: - Lifecycle

    public init(window: UIWindow) {
        self.childCoordinators = []
        self.window = window
    }

    // MARK: - Public methods

    public func start() {
        if !window.isKeyWindow {
            window.makeKeyAndVisible()
        }

        childCoordinators.removeAll()
        showTabBarFlow()
    }

    // MARK: - Private methods

    private func showTabBarFlow() {
        let coordinator = createTabBarCoordinator()
        window.rootViewController = coordinator.rootViewController
        coordinator.start()
    }

    private func createTabBarCoordinator() -> Coordinating {
        let coordinator = TabBarCoordinator()
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        return coordinator
    }
}

// MARK: - TabBar Coordinator Delegate

extension AppCoordinator: TabBarCoordinatorDelegate {
    func tabBarCoordinatorDidFinish(coordinator: TabBarCoordinator) {
        start()
    }
}
