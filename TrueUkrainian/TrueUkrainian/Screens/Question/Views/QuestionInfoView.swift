//
//  QuestionInfoView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class QuestionInfoView: UIView {

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
        setupTextLabel()
    }

    private func setupTextLabel() {
        textLabel.font = .systemFont(ofSize: 20, weight: .regular)
        textLabel.textColor = .mainText
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        addSubview(textLabel, withEdgeInsets: UIEdgeInsets(top: 14, left: 38, bottom: 14, right: 38))
    }

    // MARK: - Public methods

    func set(backColor: UIColor, text: String) {
        backgroundColor = backColor
        textLabel.text = text
    }
}
