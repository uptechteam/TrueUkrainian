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
    private let iconImageView = UIImageView()
    private let lineView = UIView()
    private let quizesLabel = UILabel()
    private let questionsLabel = UILabel()

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
        setupBottomLabels()
        setupStackView()
    }

    private func setupContentView() {
        layer.roundCornersContinuosly(radius: 8)

        iconImageView.setContentHuggingPriority(.required, for: .horizontal)
        lineView.backgroundColor = .disableBtn
        NSLayoutConstraint.activate([lineView.heightAnchor.constraint(equalToConstant: 1)])
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

    private func setupBottomLabels() {
        quizesLabel.font = .systemFont(ofSize: 14, weight: .regular)
        quizesLabel.textColor = UIColor(red: 85.0 / 255, green: 85.0 / 255, blue: 85.0 / 255, alpha: 1)
        questionsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        questionsLabel.textColor = UIColor(red: 85.0 / 255, green: 85.0 / 255, blue: 85.0 / 255, alpha: 1)
    }

    private func setupStackView() {
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8
        let topStackView = UIStackView(arrangedSubviews: [labelsStackView, iconImageView])
        topStackView.alignment = .top
        topStackView.spacing = 28
        let bottomStackView = UIStackView(arrangedSubviews: [quizesLabel, UIView(), questionsLabel])
        let stackView = UIStackView(arrangedSubviews: [topStackView, lineView, bottomStackView])
        stackView.axis = .vertical
        stackView.setCustomSpacing(14, after: topStackView)
        stackView.setCustomSpacing(9, after: lineView)
        stackView.isUserInteractionEnabled = false
        addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
    }

    // MARK: - Public methods

    func configure(backgroundColor: UIColor, title: String, desc: String, icon: UIImage, quiz: String, questions: String) {
        self.backgroundColor = backgroundColor
        titleLabel.text = title
        descriptionLabel.text = desc
        iconImageView.image = icon
        quizesLabel.text = quiz
        questionsLabel.text = questions
    }
}
