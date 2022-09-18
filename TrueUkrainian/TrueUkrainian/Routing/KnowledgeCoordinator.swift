//
//  KnowledgeCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class KnowledgeCoordinator: NSObject, Coordinating {

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
        super.init()
        setupUI()
    }

    deinit {
        print("Deinit \(self)")
    }

    // MARK: - Set up

    private func setupUI() {
        navigationController.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold),
            .foregroundColor: UIColor.mainText
        ]
        let tabBarItem = UITabBarItem(title: nil, image: .knowledgeDeselected, selectedImage: .knowledgeSelected)
        tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        navigationController.tabBarItem = tabBarItem
        navigationController.delegate = self
    }

    // MARK: - Public methods

    func start() {
        let dependencies = KnowledgeViewController.Dependencies()
        let viewController = KnowledgeViewController(
            store: KnowledgeViewController.makeStore(dependencies: dependencies),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension KnowledgeCoordinator: KnowledgeCategoryCoordinating {

}

extension KnowledgeCoordinator: KnowledgeCoordinating {
    func showCategory(_ category: Category) {
        let dependencies = KnowledgeCategoryViewController.Dependencies()
        let viewController = KnowledgeCategoryViewController(
            store: KnowledgeCategoryViewController.makeStore(dependencies: dependencies, category: category),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension KnowledgeCoordinator: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        navigationController.setNavigationBarHidden(viewController is KnowledgeViewController, animated: true)
    }
}
