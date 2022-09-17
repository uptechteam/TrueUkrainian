//
//  ProfileView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class ProfileView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

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
    }

    private func setupContentView() {
        backgroundColor = .blue
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
