//
//  CongratsView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class CongratsView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let homeButton = Button()
    // callbacks
    var onTapHome: () -> Void = { }

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
        setupHomeButton()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        titleLabel.textColor = .mainText
        titleLabel.text = "Вітання!"
    }

    private func setupHomeButton() {
        homeButton.setTitle("На головну")
        homeButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapHome() }), for: .touchUpInside)
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, UIView(), homeButton])
        stackView.axis = .vertical
        addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 130, left: 24, bottom: 60, right: 24))
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
