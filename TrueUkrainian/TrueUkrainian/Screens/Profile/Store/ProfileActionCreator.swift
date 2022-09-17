//
//  ProfileActionCreator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Foundation
import Combine

extension ProfileViewController {

    public final class ActionCreator {

        // MARK: - Properties

        private let dependencies: Dependencies
        private let cancellables = [AnyCancellable]()

        // MARK: - Lifecycle

        public init(dependencies: Dependencies) {
            self.dependencies = dependencies
        }
    }
}
