//
//  TopicDetailsView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class TopicDetailsView: UIView {

    struct Props: Equatable {
        let backColor: UIColor
        let title: String
        let details: String
    }

    // MARK: - Properties

    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let detailsLabel = UILabel()

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
        backgroundColor = .bg
    }

    private func setupLabels() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .mainText

        detailsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        detailsLabel.textColor = .secondaryText
        detailsLabel.numberOfLines = 0

        containerView.backgroundColor = .bg
    }

    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, detailsLabel, UIView()])
        stackView.axis = .vertical
        stackView.spacing = 8
        containerView.addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
        addSubview(containerView, withEdgeInsets: .zero, isSafeAreaRequired: true)
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backColor
        titleLabel.text = props.title
        detailsLabel.text = props.details
    }
}
