//
//  ProfileAvatarView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class ProfileAvatarView: UIView {

    // MARK: - Properties

    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let ageStackView = UIStackView()
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
        setupImageView()
        setupNameLabel()
        setupAgeLabel()
        setupAgeStackView()
        setupStackView()
    }

    private func setupImageView() {
        avatarImageView.image = UIImage(named: "avatar")
    }

    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Leila"
        nameLabel.font = .systemFont(ofSize: 24, weight: .light)
    }

    private func setupAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "24 роки"
        ageLabel.textColor = .secondaryText
        ageLabel.font = .systemFont(ofSize: 16)
    }

    private func setupAgeStackView() {
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.spacing = 1
        ageStackView.axis = .vertical
        ageStackView.addArrangedSubview(nameLabel)
        ageStackView.addArrangedSubview(ageLabel)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(ageStackView)
        stackView.addArrangedSubview(UIView())
        stackView.spacing = 16
        stackView.alignment = .bottom
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
