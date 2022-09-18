//
//  CongratsActionCreator.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import Foundation
import Combine

extension CongratsViewController {

    public final class ActionCreator {

        // MARK: - Properties

        private let dependencies: Dependencies
        private let cancellables = [AnyCancellable]()

        // MARK: - Lifecycle

        init(dependencies: Dependencies) {
            self.dependencies = dependencies
        }
    }
}
