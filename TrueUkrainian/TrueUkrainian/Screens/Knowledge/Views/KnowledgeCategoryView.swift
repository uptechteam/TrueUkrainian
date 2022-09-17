//
//  KnowledgeCategoryView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class KnowledgeCategoryView: UIControl {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()

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
        setupArrowImageView()
        setupStackView()
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        titleLabel.textColor = .mainText
    }

    private func setupArrowImageView() {
        arrowImageView.image = .rightArrow
        arrowImageView.setContentHuggingPriority(.required, for: .horizontal)
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, arrowImageView])
        stackView.spacing = 8
        stackView.alignment = .center
        addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 28, left: 24, bottom: 28, right: 24))
    }

    // MARK: - Public methods

    func configure(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        titleLabel.text = title
    }
}
