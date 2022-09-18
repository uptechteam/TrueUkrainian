//
//  QuestionAnswerView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class QuestionAnswerView: UIControl {

    struct Props: Equatable {
        let backColor: UIColor
        let text: String
    }

    // MARK: - Properties

    private let textLabel = UILabel()

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
        setupTextLabel()
    }

    private func setupContentView() {
        backgroundColor = UIColor(red: 233.0 / 255, green: 233.0 / 255, blue: 233.0 / 255, alpha: 1)
        layer.roundCornersContinuosly(radius: 4)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    private func setupTextLabel() {
        textLabel.font = .systemFont(ofSize: 20, weight: .regular)
        textLabel.textColor = .black
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        addSubview(textLabel, withEdgeInsets: UIEdgeInsets(top: 18, left: 16, bottom: 18, right: 16))
    }

    // MARK: - Public methods

    func render(props: Props) {
        backgroundColor = props.backColor
        textLabel.text = props.text
    }
}
