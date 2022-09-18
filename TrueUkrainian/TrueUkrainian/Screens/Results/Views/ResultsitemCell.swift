//
//  ResultsitemCell.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class ResultsitemCell: UICollectionViewCell, ReusableCell {

    struct Props: Hashable {
        let backColor: UIColor
        let title: String
        let arrowImage: UIImage
        let isDescVisible: Bool
        let desc: String

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
        setupLabels()
        setupStackView()
    }

    private func setupLabels() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0

        arrowImageView.setContentHuggingPriority(.required, for: .horizontal)
        arrowImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
    }

    private func setupStackView() {
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, arrowImageView])
        titleStackView.alignment = .center
        titleStackView.spacing = 8
        let stackView = UIStackView(arrangedSubviews: [titleStackView, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        contentView.addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24))
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backColor
        titleLabel.text = props.title
        arrowImageView.image = props.arrowImage
        descriptionLabel.text = props.desc
        descriptionLabel.isHidden = !props.isDescVisible
    }

    static func calcualteSize(props: Props, availableWidth: CGFloat) -> CGSize {
        let titleWidth = availableWidth - 48 - 18 - 8
        let titleSize = String.calculateTextSize(props.title, width: titleWidth, font: .systemFont(ofSize: 14, weight: .regular))
        if props.isDescVisible {
            let descWidth = availableWidth - 48
            let descSize = String.calculateTextSize(props.desc, width: descWidth, font: .systemFont(ofSize: 14, weight: .regular))
            return CGSize(width: availableWidth, height: titleSize.height + descSize.height + 24 + 12)
        } else {
            return CGSize(width: availableWidth, height: 24 + titleSize.height)
        }
    }
}
