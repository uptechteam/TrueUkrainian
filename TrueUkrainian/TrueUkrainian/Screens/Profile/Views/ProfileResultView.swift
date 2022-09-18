//
//  ProfileResultView.swift
//  TrueUkrainian
//
//  Created by Ekaterina Romanchenko on 18.09.2022.
//

import UIKit

final class ProfileResultView: UIView {

    struct Props: Equatable {
        let quizCount: Int
        let pointsCount: Int
    }

    // MARK: - Properties

    private let quizCountLabel = UILabel()
    private let pointsCountLabel = UILabel()
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
        setupQuizCountLabel()
        setupPointsCountLabel()
        setupStackView()
    }

    private func setupQuizCountLabel() {
        quizCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupPointsCountLabel() {
        pointsCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(quizCountLabel)
        stackView.addArrangedSubview(pointsCountLabel)
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {
        let regularStringAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .light)]
        let boldStringAttributes: [NSAttributedString.Key: Any] =
        [.font: UIFont.boldSystemFont(ofSize: 20)]

        let quizString = NSMutableAttributedString(string: "Пройдено ", attributes: regularStringAttributes)
        let quizCountString = NSAttributedString(string: "\(props.quizCount)", attributes: boldStringAttributes)
        let quizNameString = NSAttributedString(string: " вікторин")
        quizString.append(quizCountString)
        quizString.append(quizNameString)
        quizCountLabel.attributedText = quizString

        let pointsString = NSMutableAttributedString(string: "Кількість балів: ", attributes: regularStringAttributes)
        let pointsCountString = NSAttributedString(string: "\(props.pointsCount)", attributes: boldStringAttributes)
        pointsString.append(pointsCountString)
        pointsCountLabel.attributedText = pointsString
    }
}
