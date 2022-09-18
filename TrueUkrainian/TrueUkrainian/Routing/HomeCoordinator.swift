//
//  HomeCoordinator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class HomeCoordinator: NSObject, Coordinating {

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
        let tabBarItem = UITabBarItem(title: nil, image: .homeDeselected, selectedImage: .homeSelected)
        tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        navigationController.tabBarItem = tabBarItem
        navigationController.delegate = self
    }

    // MARK: - Public methods

    func start() {
        let viewController = makeHomeViewController()
        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - Private methods

    private func makeHomeViewController() -> HomeViewController {
        let dependencies = HomeViewController.Dependencies()
        return HomeViewController(
            store: HomeViewController.makeStore(dependencies: dependencies),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
    }
}

extension HomeCoordinator: CategoryCoordinating {
    func didTapStartQuiz(category: Category) {
        let dependencies = QuestionViewController.Dependencies()
        let quiz = QuizProvider().getQuiz(category: category)
        let activeQuiz = ActiveQuiz(corectAnswers: 0, index: 0, quiz: quiz)
        let viewController = QuestionViewController(
            store: QuestionViewController.makeStore(dependencies: dependencies, activeQuiz: activeQuiz),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension HomeCoordinator: CongratsCoordinating {
    func didFinishCongrats() {
        let viewController = makeHomeViewController()
        navigationController.setViewControllers([viewController], animated: false)
    }

    func didTapResults(activeQuiz: ActiveQuiz) {
        let dependencies = ResultsViewController.Dependencies()
        let viewController = ResultsViewController(
            store: ResultsViewController.makeStore(dependencies: dependencies),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinating {
    func showCategory(_ category: Category) {
        let dependencies = CategoryViewController.Dependencies()
        let viewController = CategoryViewController(
            store: CategoryViewController.makeStore(dependencies: dependencies, category: category),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: QuestionCoordinating {
    func didFinishQuiz(activeQuiz: ActiveQuiz) {
        let dependencies = CongratsViewController.Dependencies()
        let viewController = CongratsViewController(
            store: CongratsViewController.makeStore(dependencies: dependencies, activeQuiz: activeQuiz),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.setViewControllers([viewController], animated: true)
    }

    func didProceedNext(activeQuiz: ActiveQuiz) {
        var quiz = activeQuiz
        quiz.index += 1
        let dependencies = QuestionViewController.Dependencies()
        let viewController = QuestionViewController(
            store: QuestionViewController.makeStore(dependencies: dependencies, activeQuiz: quiz),
            actionCreator: .init(dependencies: dependencies),
            coordinator: self
        )
        navigationController.setViewControllers([viewController], animated: true)
    }

    func didTapCloseQuiz() {
        let viewController = makeHomeViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension HomeCoordinator: ResultsCoordinating {
    
}

extension HomeCoordinator: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        navigationController.setNavigationBarHidden(
            viewController is HomeViewController || viewController is QuestionViewController || viewController is CongratsViewController,
            animated: true
        )
    }
}
