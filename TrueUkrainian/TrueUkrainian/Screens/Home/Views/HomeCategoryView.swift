//
//  CategoryView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class HomeCategoryView: UIControl {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

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
        setupDescriptionLabel()
        setupStackView()
    }

    private func setupContentView() {
        layer.roundCornersContinuosly(radius: 8)
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        titleLabel.textColor = .mainText
    }

    private func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .black
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isUserInteractionEnabled = false
        addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
    }

    // MARK: - Public methods

    func configure(backgroundColor: UIColor, title: String, desc: String) {
        self.backgroundColor = backgroundColor
        titleLabel.text = title
        descriptionLabel.text = desc
    }
}
