//
//  AlertView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class AlertView: UIView {

    // MARK: - Properties

    private let alertView: AlertContentView
    private let backgroundView = UIView()
    private var alertViewTopConstraint: NSLayoutConstraint!
    var onCompleteDismissAnimation: () -> Void = { }

    // MARK: - Lifecycle

    required init(question: Question) {
        alertView = AlertContentView(question: question)
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up

    private func setup() {
        setupBackgroundView()
        setupAlertView()
    }

    private func setupBackgroundView() {
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        addSubview(backgroundView, withEdgeInsets: .zero)
    }

    private func setupAlertView() {
        alertView.onButtonTap = { [weak self] in
            self?.animateDisappearance()
        }
        alertViewTopConstraint = alertView.topAnchor.constraint(equalTo: bottomAnchor)
        addSubview(alertView, constraints: [
            alertViewTopConstraint,
            alertView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    // MARK: - Public  methods

    func animateAppearance() {
        UIView.animate(withDuration: 0.3) {
            self.alertViewTopConstraint.constant = -self.alertView.frame.height
            self.backgroundView.alpha = 0.5
            self.layoutIfNeeded()
        }
    }

    // MARK: - Private methods

    private func animateDisappearance() {
        UIView.animate(withDuration: 0.3) {
            self.alertViewTopConstraint.constant = 0
            self.backgroundView.alpha = 0
            self.layoutIfNeeded()
        } completion: { _ in
            self.onCompleteDismissAnimation()
        }
    }
}

