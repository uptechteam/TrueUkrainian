//
//  ProfileRatingView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class ProfileRatingView: UIView {

    struct Props: Equatable {
        let progress: Double
    }

    // MARK: - Properties

    private let ratingLabel = UILabel()
    private let rankLabel = UILabel()
    private let rankStackView = UIStackView()
    private let progressView = ProgressView()
    private let stackView = UIStackView()

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
        setupRatingLabel()
        setupRankLabel()
        setupRankStackView()
        setupProgressView()
        setupStackView()
    }

    private func setupRatingLabel() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Твій рейтинг"
        ratingLabel.textColor = #colorLiteral(red: 0.3450978994, green: 0.3450981379, blue: 0.3494020104, alpha: 1)
        ratingLabel.font = .systemFont(ofSize: 16)
    }

    private func setupRankLabel() {
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        rankLabel.text = "Селянин"
        rankLabel.textColor = .mainText
        rankLabel.font = .systemFont(ofSize: 16)
    }

    private func setupRankStackView() {
        rankStackView.translatesAutoresizingMaskIntoConstraints = false
        rankStackView.addArrangedSubview(ratingLabel)
        rankStackView.addArrangedSubview(UIView())
        rankStackView.addArrangedSubview(rankLabel)
    }

    private func setupProgressView() {
        progressView.configure(
            backColor: UIColor.white,
            fillColor: .darkPurple
        )
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(rankStackView)
        stackView.addArrangedSubview(progressView)
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {
        progressView.set(progress: props.progress)
    }
}

