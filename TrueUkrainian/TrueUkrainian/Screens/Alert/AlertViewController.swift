//
//  AlertViewController.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

final class AlertViewController: UIViewController {

    // MARK: - Properties

    private let contentView: AlertView
    // callback
    var onDismiss: () -> Void = { }

    // MARK: - Lifecycle

    public required init(question: Question) {
        self.contentView = AlertView(question: question)
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = contentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.animateAppearance()
    }

    // MARK: - Setup

    private func setup() {
        modalPresentationStyle = .overFullScreen
        contentView.onCompleteDismissAnimation = { [weak self] in
            self?.dismiss(animated: false)
            self?.onDismiss()
        }
    }
}
