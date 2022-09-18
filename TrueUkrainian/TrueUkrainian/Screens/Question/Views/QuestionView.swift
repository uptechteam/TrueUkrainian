//
//  QuestionView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class QuestionView: UIView {

    struct Props: Equatable {
        let progress: Double
        let buttonTitle: String
    }

    // MARK: - Properties

    private let topStackView = UIStackView()
    private let progressView = ProgressView()
    private let closeButton = UIButton()
    private let actionButton = Button()
    // callbacks
    var onTapClose: () -> Void = { }
    var onTapAction: () -> Void = { }

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
        setupTopStackView()
        setupActionButton()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTopStackView() {
        [progressView, closeButton].forEach(topStackView.addArrangedSubview)
        topStackView.spacing = 36
        topStackView.alignment = .center
        closeButton.setImage(.close, for: .normal)
        closeButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapClose() }), for: .touchUpInside)
        progressView.configure(
            backColor: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1),
            fillColor: .darkPurple
        )
    }

    private func setupActionButton() {
        actionButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapAction() }), for: .touchUpInside)
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [topStackView, UIView(), actionButton])
        stackView.axis = .vertical
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 24, bottom: 60, right: 24),
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {
        progressView.set(progress: props.progress)
        actionButton.setTitle(props.buttonTitle)
    }
}
