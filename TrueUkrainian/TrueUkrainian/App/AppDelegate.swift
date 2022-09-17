//
//  AppDelegate.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    private var coordinator: AppCoordinator?

    // MARK: - Public methods

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.coordinator = AppCoordinator(window: UIWindow())
        self.coordinator?.start()
        return true
    }
}
