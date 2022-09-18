//
//  QuestionView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class QuestionView: UIView {

    struct Props: Equatable {
        let progress: Double
        let category: String
        let counterText: String
        let questionBackColor: UIColor
        let question: String
        let answerOneViewProps: QuestionAnswerView.Props
        let answerTwoViewProps: QuestionAnswerView.Props
        let answerThreeViewProps: QuestionAnswerView.Props
        let answerFourViewProps: QuestionAnswerView.Props
        let buttonTitle: String
    }

    // MARK: - Properties

    private let topStackView = UIStackView()
    private let progressView = ProgressView()
    private let closeButton = UIButton()
    private let categoryLabel = UILabel()
    private let counterLabel = UILabel()
    private let questionInfoView = QuestionInfoView()
    private let answerOne = QuestionAnswerView()
    private let answerTwo = QuestionAnswerView()
    private let answerThree = QuestionAnswerView()
    private let answerFour = QuestionAnswerView()
    private let actionButton = Button()
    // callbacks
    var onTapClose: () -> Void = { }
    var onTapAnswer: (Int) -> Void = { _ in }
    var onTapAction: () -> Void = { }

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
        setupCategory()
        setupAnswers()
        setupTopStackView()
        setupActionButton()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTopStackView() {
        [progressView, closeButton].forEach(topStackView.addArrangedSubview)
        topStackView.spacing = 36
        topStackView.alignment = .center
        closeButton.setImage(.close, for: .normal)
        closeButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapClose() }), for: .touchUpInside)
        progressView.configure(
            backColor: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1),
            fillColor: .darkPurple
        )
    }

    private func setupCategory() {
        categoryLabel.font = .systemFont(ofSize: 16, weight: .regular)
        categoryLabel.textColor = UIColor(red: 88.0 / 255, green: 88.0 / 255, blue: 88.0 / 255, alpha: 1)
        counterLabel.font = .systemFont(ofSize: 16, weight: .regular)
        counterLabel.textColor = .black
    }

    private func setupAnswers() {
        answerOne.addAction(UIAction(handler: { [weak self] _ in self?.onTapAnswer(0) }), for: .touchUpInside)
        answerTwo.addAction(UIAction(handler: { [weak self] _ in self?.onTapAnswer(1) }), for: .touchUpInside)
        answerThree.addAction(UIAction(handler: { [weak self] _ in self?.onTapAnswer(2) }), for: .touchUpInside)
        answerFour.addAction(UIAction(handler: { [weak self] _ in self?.onTapAnswer(3) }), for: .touchUpInside)
    }

    private func setupActionButton() {
        actionButton.addAction(UIAction(handler: { [weak self] _ in self?.onTapAction() }), for: .touchUpInside)
    }
    

    private func setupStackView() {
        let categoryStackView = UIStackView(arrangedSubviews: [categoryLabel, UIView(), counterLabel])
        let firstLineStackView = UIStackView(arrangedSubviews: [answerOne, answerTwo])
        firstLineStackView.distribution = .fillEqually
        firstLineStackView.spacing = 8
        let secondLineStackView = UIStackView(arrangedSubviews: [answerThree, answerFour])
        secondLineStackView.distribution = .fillEqually
        secondLineStackView.spacing = 8
        let stackView = UIStackView(
            arrangedSubviews: [
                topStackView,
                categoryStackView,
                questionInfoView,
                firstLineStackView,
                secondLineStackView,
                UIView(),
                actionButton
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.setCustomSpacing(27, after: topStackView)
        stackView.setCustomSpacing(8, after: categoryStackView)
        stackView.setCustomSpacing(27, after: questionInfoView)
        stackView.setCustomSpacing(8, after: firstLineStackView)
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 0, bottom: 60, right: 0),
            isSafeAreaRequired: true
        )
        NSLayoutConstraint.activate([
            topStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -48),
            categoryStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -48),
            questionInfoView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            firstLineStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -48),
            secondLineStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -48),
            actionButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -48)
        ])
    }

    // MARK: - Public methods

    func render(props: Props) {
        progressView.set(progress: props.progress)
        categoryLabel.text = props.category
        counterLabel.text = props.counterText
        questionInfoView.set(backColor: props.questionBackColor, text: props.question)
        answerOne.render(props: props.answerOneViewProps)
        answerTwo.render(props: props.answerTwoViewProps)
        answerThree.render(props: props.answerThreeViewProps)
        answerFour.render(props: props.answerFourViewProps)
        actionButton.setTitle(props.buttonTitle)
    }
}
