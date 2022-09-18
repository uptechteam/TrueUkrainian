//
//  CategoryView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class CategoryView: UIView {

    struct Props: Equatable {
        let backgroundColor: UIColor
        let description: String
    }

    // MARK: - Properties

    private let descriptionLabel = UILabel()
    private let levelView = CategorySettingsView()
    private let questionCountView = CategorySettingsView()
    private let startButton = Button()
    // callbacks
    var onTapStart: () -> Void = { }

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
        setupContentViuew()
        setupDescLabel()
        setupSettings()
        setupStartButton()
        setupStackView()
    }

    private func setupContentViuew() {
        backgroundColor = .bg
    }

    private func setupDescLabel() {
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textColor = .mainText
        descriptionLabel.numberOfLines = 0
    }

    private func setupSettings() {
        levelView.configure(title: "Рівень", value: "Легкий")
        questionCountView.configure(title: "Кількість запитань", value: "10")
    }

    private func setupStartButton() {
        startButton.setTitle("Розпочати!")
        startButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapStart() }), for: .touchUpInside)
    }

    private func setupStackView() {
        let stackView = UIStackView(
            arrangedSubviews: [descriptionLabel, levelView, questionCountView, UIView(), startButton]
        )
        stackView.axis = .vertical
        stackView.setCustomSpacing(62, after: descriptionLabel)
        stackView.setCustomSpacing(16, after: levelView)
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 24, bottom: 60, right: 24),
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backgroundColor
        descriptionLabel.text = props.description
    }
}
