//
//  ProfileView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class ProfileView: UIView {

    struct Props: Equatable {
        let resultViewProps: ProfileResultView.Props
        let profileRatingProps: ProfileRatingView.Props
    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let avatarView = ProfileAvatarView()
    private let resultView = ProfileResultView()
    private let ratingView = ProfileRatingView()
    private let ratingButton = ProfileButton()
    private let dictionaryButton = ProfileButton()
    private let infoButton = ProfileButton()
    private let buttonsStackView = UIStackView()
    private let stackView = UIStackView()
    // callbacks
    var onDidTabRatingButton: () -> Void = { }
    var onDidTapDictionaryButton: () -> Void = { }
    var ondidTapInfoButton: () -> Void = { }


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
        setupTitleLabel()
        setupRatingButton()
        setupDictionaryButton()
        setupInfoButton()
        setupButtonsStackView()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = #colorLiteral(red: 0.9131578207, green: 0.9380688071, blue: 0.9591285586, alpha: 1)
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Твоя Сторінка"
        titleLabel.font = .systemFont(ofSize: 24)
    }

    private func setupRatingButton() {
        ratingButton.setCustomTitle("Рейтинг друзів")
        ratingButton.addAction(
            UIAction(handler: { [weak self] action in
                self?.onDidTabRatingButton()
            }),
            for: .touchUpInside
        )
    }

    private func setupDictionaryButton() {
        dictionaryButton.setCustomTitle("Словник")
        dictionaryButton.addAction(
            UIAction(handler: { [weak self] action in
                self?.onDidTapDictionaryButton()
            }),
            for: .touchUpInside
        )
    }

    private func setupInfoButton() {
        infoButton.setCustomTitle("Що по русні?")
        infoButton.addAction(
            UIAction(handler: { [weak self] action in
                self?.ondidTapInfoButton()
            }),
            for: .touchUpInside
        )
    }

    private func setupButtonsStackView() {
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 8
        buttonsStackView.addArrangedSubview(ratingButton)
        buttonsStackView.addArrangedSubview(dictionaryButton)
        buttonsStackView.addArrangedSubview(infoButton)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(resultView)
        stackView.addArrangedSubview(ratingView)
        stackView.addArrangedSubview(buttonsStackView)
        stackView.addArrangedSubview(UIView())
        stackView.axis = .vertical
        stackView.spacing = 32
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 76),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {
        resultView.render(props: props.resultViewProps)
        ratingView.render(props: props.profileRatingProps)
    }
}

import UIKit

final class ProfileButton: UIButton {

    // MARK: - Properties

    private let customTitleLabel = UILabel()
    private let arrowImageView = UIImageView()
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
        setupCustomTitleLabel()
        setupArrowsImageView()
        setupStackView()
    }

    private func setupContentView() {
        layer.roundCornersContinuosly(radius: 8, corners: .all)
        layer.addBorder(color: .borderColor, width: 1)
        backgroundColor = .white
    }

    private func setupCustomTitleLabel() {
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        customTitleLabel.font = .systemFont(ofSize: 20, weight: .light)
    }

    private func setupArrowsImageView() {
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.image = UIImage(named: "profileRightArrow")
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(customTitleLabel)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(arrowImageView)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }

    // MARK: - Public methods

    func setCustomTitle(_ text: String) {
        self.customTitleLabel.text = text
    }
}

