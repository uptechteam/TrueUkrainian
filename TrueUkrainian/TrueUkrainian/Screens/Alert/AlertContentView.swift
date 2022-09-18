//
//  AlertContentView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class AlertContentView: UIView {

    // MARK: - Properties

    private let question: Question
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let nextButton = Button()
    // callbacks
    private var callback: (() -> Void)?
    var onButtonTap: () -> Void = { }

    // MARK: - Lifecycle

    required init(question: Question) {
        self.question = question
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up

    private func setup() {
        setupContentView()
        setupTitleLabel()
        setupMessageLabel()
        setupNextButton()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .menuPurple
        layer.roundCornersContinuosly(radius: 16, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .mainText
        titleLabel.text = "Ось, деталі..."
    }

    private func setupMessageLabel() {
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 16, weight: .regular)
        messageLabel.textColor = .mainText
        messageLabel.text = question.correctAnswerDescription
    }

    private func setupNextButton() {
        nextButton.setTitle("Наступний")
        nextButton.addAction(
            UIAction(handler: { [weak self] _ in self?.onButtonTap() }),
            for: .touchUpInside
        )
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel, nextButton])
        stackView.axis = .vertical
        stackView.setCustomSpacing(8, after: titleLabel)
        stackView.setCustomSpacing(111, after: messageLabel)
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 24, left: 24, bottom: 60, right: 24),
            isSafeAreaRequired: true
        )
    }
}
