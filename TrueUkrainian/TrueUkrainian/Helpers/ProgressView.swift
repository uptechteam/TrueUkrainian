//
//  ProgressView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class ProgressView: UIView {

    // MARK: - Properties

    private let filledProgressView = UIView()
    private var widthConstraint: NSLayoutConstraint!

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
        setupFilledProgressView()
    }

    private func setupContentView() {
        layer.roundCornersContinuosly(radius: 7)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 14)
        ])
    }

    private func setupFilledProgressView() {
        filledProgressView.layer.roundCornersContinuosly(radius: 7)
        widthConstraint = filledProgressView.widthAnchor.constraint(equalToConstant: 0)
        addSubview(filledProgressView, constraints: [
            filledProgressView.topAnchor.constraint(equalTo: topAnchor),
            filledProgressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filledProgressView.bottomAnchor.constraint(equalTo: bottomAnchor),
            widthConstraint
        ])
    }

    // MARK: - Public methods

    func configure(backColor: UIColor, fillColor: UIColor) {
        backgroundColor = backColor
        filledProgressView.backgroundColor = fillColor
    }

    func set(progress: Double) {
        widthConstraint.constant = bounds.width * CGFloat(progress)
    }
}
