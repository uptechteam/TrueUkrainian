//
//  Button.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

public final class Button: UIControl {

    // MARK: - Properties

    private let titleLabel = UILabel()
    private var backColor = UIColor(red: 73.0 / 255, green: 73.0 / 255, blue: 73.0 / 255, alpha: 1)
    private var titleColor = UIColor.white

    public override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? backColor.withAlphaComponent(0.7) : backColor
        }
    }

    public override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? backColor : backColor.withAlphaComponent(0.4)
        }
    }

    // MARK: - Lifecycle

    public override init(frame: CGRect) {
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
    }

    private func setupContentView() {
        layer.roundCornersContinuosly(radius: 8)
        backgroundColor = backColor
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = titleColor
        addSubview(titleLabel, constraints: [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Public methods

    public func configure(backColor: UIColor, titleColor: UIColor) {
        self.backColor = backColor
        self.titleColor = titleColor
        backgroundColor = backColor
        titleLabel.textColor = titleColor
    }

    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
