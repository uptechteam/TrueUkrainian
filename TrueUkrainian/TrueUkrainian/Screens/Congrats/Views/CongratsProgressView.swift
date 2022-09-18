//
//  CongratsProgressView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class CongratsProgressView: UIView {

    struct Props: Equatable {
        let ratingName: String
        let progress: Double
        let minPoints: String
        let points: String
        let maxPoints: String
    }

    // MARK: - Properties

    private let ratingLabel = UILabel()
    private let yourRatingLabel = UILabel()
    private let progressView = ProgressView()
    private let pointsLabel = UILabel()
    private let minPointsLabel = UILabel()
    private let maxPointsLabel = UILabel()

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
        progressView.configure(backColor: .white, fillColor: .btn)
        setupStackView()
    }

    private func setupLabels() {
        ratingLabel.font = .systemFont(ofSize: 16, weight: .regular)
        ratingLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)
        ratingLabel.text = "Твій рейтинг"

        yourRatingLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        yourRatingLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)

        minPointsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        minPointsLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)

        pointsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        pointsLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)

        maxPointsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        maxPointsLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)
    }

    private func setupStackView() {
        let topStackView = UIStackView(arrangedSubviews: [ratingLabel, UIView(), yourRatingLabel])
        let bottomStackView = UIStackView(arrangedSubviews: [minPointsLabel, UIView(), maxPointsLabel])
        bottomStackView.addSubview(pointsLabel, constraints: [
            pointsLabel.centerXAnchor.constraint(equalTo: bottomStackView.centerXAnchor),
            pointsLabel.centerYAnchor.constraint(equalTo: bottomStackView.centerYAnchor)
        ])
        let stackView = UIStackView(arrangedSubviews: [topStackView, progressView, bottomStackView])
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView, withEdgeInsets: .zero)
    }

    // MARK: - Public methods

    func render(props: Props) {
        yourRatingLabel.text = props.ratingName
        progressView.set(progress: props.progress)
        minPointsLabel.text = props.minPoints
        pointsLabel.text = props.points
        maxPointsLabel.text = props.maxPoints
    }
}
