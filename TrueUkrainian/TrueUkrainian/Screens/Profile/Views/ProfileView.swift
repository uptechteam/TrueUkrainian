//
//  ProfileView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class ProfileView: UIView {

    struct Props: Equatable {
        let resultViewProps: ResultView.Props
    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let avatarView = AvatarView()
    private let resultView = ResultView()


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
        setupContentView()
        setupTitleLabel()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Твоя Сторінка"
        titleLabel.font = .systemFont(ofSize: 24)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(avatarView)
        stackView.addArrangedSubview(resultView)
        stackView.addArrangedSubview(UIView())
        stackView.axis = .vertical
        stackView.spacing = 32
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 76),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }


    // MARK: - Public methods

    func render(props: Props) {
        resultView.render(props: props.resultViewProps)
    }
}


import UIKit

final class AvatarView: UIView {

    // MARK: - Properties

    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let ageStackView = UIStackView()
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
        setupImageView()
        setupNameLabel()
        setupAgeLabel()
        setupAgeStackView()
        setupStackView()
    }

    private func setupImageView() {
        avatarImageView.image = UIImage(named: "avatar")
    }

    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Leila"
        nameLabel.font = .systemFont(ofSize: 24)
    }

    private func setupAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "24 роки"
        ageLabel.textColor = .secondaryText
        ageLabel.font = .systemFont(ofSize: 16)
    }

    private func setupAgeStackView() {
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.spacing = 1
        ageStackView.axis = .vertical
        ageStackView.addArrangedSubview(nameLabel)
        ageStackView.addArrangedSubview(ageLabel)
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(ageStackView)
        stackView.addArrangedSubview(UIView())
        stackView.spacing = 16
        stackView.alignment = .bottom
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

import UIKit

final class ResultView: UIView {

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

