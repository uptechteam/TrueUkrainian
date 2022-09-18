//
//  MyFriendsViewController.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import Combine
import UIKit

public final class MyFriendsViewController: UIViewController {

    // MARK: - Properties

    private let contentView = MyFriendsView()
    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init() {
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
    }

    // MARK: - Private methods

    private func setupUI() {
        hidesBottomBarWhenPushed = true
        navigationItem.title = "Moї друзі"
    }
}
