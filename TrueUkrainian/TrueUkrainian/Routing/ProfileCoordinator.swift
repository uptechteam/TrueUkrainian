//
//  ProfileCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class ProfileCoordinator: NSObject, Coordinating {

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
        let tabBarItem = UITabBarItem(title: nil, image: .profileDeselected, selectedImage: .profileSelected)
        tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        navigationController.tabBarItem = tabBarItem
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
    func didTapRating() {
        let viewController = MyFriendsViewController()
        navigationController.pushViewController(viewController, animated: true)
    }

    func didTapDictionary() {

    }

    func didTapInfo() {
        let viewController = DeadRussionViewController(
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ProfileCoordinator: DeadRussionCoordinating {
    func didTapWhereDotate() {

    }

    func didTapShare() {

    }
}

extension ProfileCoordinator: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        navigationController.setNavigationBarHidden(viewController is KnowledgeViewController, animated: true)
    }
}
