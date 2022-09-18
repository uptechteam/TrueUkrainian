//
//  CongratsView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class CongratsView: UIView {

    struct Props: Equatable {
        let backColor: UIColor
        let pointsText: String
        let correctAnswerText: String
        let progressViewProps: CongratsProgressView.Props
    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let pointsLabel = UILabel()
    private let correctAnswerLabel = UILabel()
    private let progressView = CongratsProgressView()
    private let resultsButton = Button()
    private let shareButton = Button()
    private let homeButton = Button()
    // callbacks
    var onTapResults: () -> Void = { }
    var onTapShare: () -> Void = { }
    var onTapHome: () -> Void = { }

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
        setupPointsLabel()
        setupCorrectAnswerLabel()
        setupResultsButton()
        setupShareButton()
        setupHomeButton()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        titleLabel.textColor = .mainText
        titleLabel.text = "Вітання!"
        titleLabel.textAlignment = .center
    }

    private func setupPointsLabel() {
        pointsLabel.font = .systemFont(ofSize: 24, weight: .medium)
        pointsLabel.textColor = .mainText
        pointsLabel.textAlignment = .center
    }

    private func setupCorrectAnswerLabel() {
        correctAnswerLabel.font = .systemFont(ofSize: 24, weight: .medium)
        correctAnswerLabel.textColor = .mainText
        correctAnswerLabel.textAlignment = .center
    }

    private func setupResultsButton() {
        resultsButton.setTitle("Результати")
        resultsButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapResults() }), for: .touchUpInside)
    }

    private func setupShareButton() {
        shareButton.configure(backColor: .white, titleColor: .mainText)
        shareButton.setTitle("Поділитися")
        shareButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapShare() }), for: .touchUpInside)
    }

    private func setupHomeButton() {
        homeButton.configure(backColor: .white, titleColor: .mainText)
        homeButton.setTitle("На головну")
        homeButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapHome() }), for: .touchUpInside)
    }

    private func setupStackView() {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, pointsLabel, correctAnswerLabel, progressView, UIView(), resultsButton, shareButton, homeButton]
        )
        stackView.axis = .vertical
        stackView.setCustomSpacing(14, after: titleLabel)
        stackView.setCustomSpacing(42, after: correctAnswerLabel)
        stackView.setCustomSpacing(14, after: resultsButton)
        stackView.setCustomSpacing(14, after: shareButton)
        addSubview(stackView, withEdgeInsets: UIEdgeInsets(top: 130, left: 24, bottom: 60, right: 24))
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backColor
        pointsLabel.text = props.pointsText
        correctAnswerLabel.text = props.correctAnswerText
        progressView.render(props: props.progressViewProps)
    }
}
