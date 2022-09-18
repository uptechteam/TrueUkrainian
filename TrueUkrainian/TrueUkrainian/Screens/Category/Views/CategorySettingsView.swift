//
//  CategorySettingsView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class CategorySettingsView: UIView {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

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
        setupTitleLabel()
        setupValueLabel()
        setupStackView()
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .mainText
    }

    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 16, weight: .medium)
        valueLabel.textColor = .mainText
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, UIView(), valueLabel])
        stackView.spacing = 4
        addSubview(stackView, withEdgeInsets: .zero)
    }

    // MARK: - Public methods

    func configure(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}
