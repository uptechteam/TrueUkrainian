//
//  QuestionView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class QuestionView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let closeButton = UIButton()
    // callbacks
    var onTapClose: () -> Void = { }

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
        setupCloseButton()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupCloseButton() {
        closeButton.setImage(.close, for: .normal)
        closeButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapClose() }), for: .touchUpInside)
        addSubview(closeButton, constraints: [
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
