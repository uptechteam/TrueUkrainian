//
//  MyFriendsView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class MyFriendsView: UIView {

    // MARK: - Properties

    private let avatarView = MyFriendsAvatarView()
    private let stackView = UIStackView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up

    private func setup() {
        setupContentView()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = #colorLiteral(red: 0.9131578207, green: 0.9380688071, blue: 0.9591285586, alpha: 1)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(UIView())
        stackView.axis = .vertical
        stackView.spacing = 32
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }
}
