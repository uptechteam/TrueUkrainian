//
//  DeadRussionView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class DeadRussionView: UIView {

    // MARK: - Properties

    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let countLabel = UILabel()
    private let whereDonateButton = Button()
    private let shareButton = Button()
    private let stackView = UIStackView()
    // callbacks
    var onDidTabWhereDonateButton: () -> Void = { }
    var onDidTabShareButton: () -> Void = { }

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
        setupBackgroundImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupCountLabel()
        setupWhereDanateButton()
        setupShareButton()
        setupStackView()
    }

    private func setupBackgroundImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: "ukraineBackground")
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        titleLabel.text = "русні пизда"
        titleLabel.textColor = .mainText
        titleLabel.textAlignment = .center
    }

    private func setupDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        descriptionLabel.textColor = .white
        descriptionLabel.text = "Втрати свинособак:"
        descriptionLabel.textAlignment = .center
    }

    private func setupCountLabel() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.font = .boldSystemFont(ofSize: 48)
        countLabel.textColor = .white
        countLabel.text = "54480"
        countLabel.textAlignment = .center
    }

    private func setupWhereDanateButton() {
        whereDonateButton.setTitle("Куда донатить?")
        whereDonateButton.addAction(
            UIAction(handler: { [weak self] _ in
                self?.onDidTabWhereDonateButton()
            }),
            for: .touchUpInside)
    }

    private func setupShareButton() {
        shareButton.setTitle("Поділитися")
        shareButton.addAction(
            UIAction(handler: { [weak self] _ in
                self?.onDidTabShareButton()
            }),
            for: .touchUpInside)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        [
            titleLabel,
            descriptionLabel,
            countLabel,
            UIView(),
            whereDonateButton,
            shareButton
        ].forEach { stackView.addArrangedSubview($0) }
        stackView.setCustomSpacing(18, after: titleLabel)
        stackView.setCustomSpacing(8, after: whereDonateButton)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 198),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -101)
        ])
    }
}
