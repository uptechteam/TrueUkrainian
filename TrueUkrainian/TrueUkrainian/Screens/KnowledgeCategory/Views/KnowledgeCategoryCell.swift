//
//  KnowledgeCategoryCell.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class KnowledgeCategoryCell: UICollectionViewCell, ReusableCell {

    struct Props: Hashable {
        let title: String
        let description: String

        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
        }
    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()
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
        setupLabels()
        setupStackView()
    }

    private func setupContentView() {
        contentView.backgroundColor = .bg
    }

    private func setupLabels() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .mainText
        titleLabel.numberOfLines = 0

        arrowImageView.image = .rightArrow
        arrowImageView.setContentHuggingPriority(.required, for: .horizontal)

        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .secondaryText
        descriptionLabel.numberOfLines = 0
    }

    private func setupStackView() {
        let topStackView = UIStackView(arrangedSubviews: [titleLabel, arrowImageView])
        let stackView = UIStackView(arrangedSubviews: [topStackView, descriptionLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        contentView.addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))

        let lineView = UIView()
        lineView.backgroundColor = .stroke
        contentView.addSubview(lineView, constraints: [
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {
        titleLabel.text = props.title
        descriptionLabel.text = props.description
    }

    static func calcualteSize(props: Props, availableWidth: CGFloat) -> CGSize {
        let titleWidth = availableWidth - 28 - 40 - 8
        let titleSize = String.calculateTextSize(props.title, width: titleWidth, font: .systemFont(ofSize: 16, weight: .medium))
        let descWidth = availableWidth - 28
        let descSize = String.calculateTextSize(props.description, width: descWidth, font: .systemFont(ofSize: 14, weight: .regular))
        return CGSize(width: availableWidth, height: titleSize.height + descSize.height + 28 + 8)
    }
}
