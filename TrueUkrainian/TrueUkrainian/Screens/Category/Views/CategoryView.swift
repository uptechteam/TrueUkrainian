//
//  CategoryView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class CategoryView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let titleLabel = UILabel()

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
        setupContentViuew()
    }

    private func setupContentViuew() {
        backgroundColor = .bg
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
