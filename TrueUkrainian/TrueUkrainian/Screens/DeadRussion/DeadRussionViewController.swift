//
//  DeadRussionViewController.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import Combine
import UIKit

protocol DeadRussionCoordinating: AnyObject {
    func didTapWhereDotate()
    func didTapShare()
}

public final class DeadRussionViewController: UIViewController {

    // MARK: - Properties

    private let contentView = DeadRussionView()
    private unowned let coordinator: DeadRussionCoordinating
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(coordinator: DeadRussionCoordinating) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("Deinit \(self)")
    }

    public override func loadView() {
        view = contentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    // MARK: - Private methods

    private func setupUI() {
        hidesBottomBarWhenPushed = true
    }

    private func setupBinding() {
        contentView.onDidTabWhereDonateButton = { [coordinator] in
            coordinator.didTapWhereDotate()
        }

        contentView.onDidTabShareButton = { [coordinator] in
            coordinator.didTapShare()
        }
    }
}
