//
//  MyFriendAvatarView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class MyFriendsAvatarView: UIView {

    // MARK: - Properties

    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let statusLabel = UILabel()
    private let ageStackView = UIStackView()
    private let stackView = UIStackView()
    private let mainView = UIView()
    private let rightArrowImageView = UIImageView()

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
        setupImageView()
        setupNameLabel()
        setupAgeLabel()
        setupStatusLabel()
        setupAgeStackView()
        setupStackView()
        setupMainView()
        setupRightArrowImageView()
    }

    private func setupImageView() {
        avatarImageView.image = UIImage(named: "avatar")
    }

    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Kсюша"
        nameLabel.font = .systemFont(ofSize: 24, weight: .light)
    }

    private func setupAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "Балів 5689"
        ageLabel.textColor = .secondaryText
        ageLabel.font = .systemFont(ofSize: 16)
    }

    private func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Звання: Гельман"
        statusLabel.textColor = .secondaryText
        statusLabel.font = .systemFont(ofSize: 16)
    }
    private func setupAgeStackView() {
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.spacing = 1
        ageStackView.axis = .vertical
        ageStackView.addArrangedSubview(nameLabel)
        ageStackView.addArrangedSubview(ageLabel)
        ageStackView.addArrangedSubview(statusLabel)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(ageStackView)
        stackView.addArrangedSubview(UIView())
        stackView.spacing = 16
        stackView.alignment = .center
    }

    private func setupRightArrowImageView() {
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.image = .rightArrow

    }

    private func setupMainView() {
        mainView.backgroundColor = .white
        mainView.addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 9, left: 24, bottom: 9, right: 24))
        mainView.addSubview(rightArrowImageView, constraints: [
            rightArrowImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24)
        ])
        addSubview(mainView, withEdgeInsets: .zero)

    }
}
