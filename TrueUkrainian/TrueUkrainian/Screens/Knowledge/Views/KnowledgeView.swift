//
//  KnowledgeView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class KnowledgeView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let countryCategoryView = KnowledgeCategoryView()
    private let historyCategoryView = KnowledgeCategoryView()
    private let cultureCategoryView = KnowledgeCategoryView()
    // callbacks
    var onTapCategory: (Category) -> Void = { _ in }

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
        setupCategories()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = .mainText
        titleLabel.text = "База Знань"
    }

    private func setupCategories() {
        countryCategoryView.configure(backgroundColor: .menuGreen, title: "Держава")
        historyCategoryView.configure(backgroundColor: .menuBlue, title: "Історія України")
        cultureCategoryView.configure(backgroundColor: .menuYellow, title: "Культура України")
    }

    private func setupStackView() {
        let labelContainerView = UIView()
        labelContainerView.addSubview(titleLabel, withEdgeInsets: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24))
        let stackView = UIStackView(
            arrangedSubviews: [labelContainerView, countryCategoryView, historyCategoryView, cultureCategoryView, UIView()]
        )
        stackView.axis = .vertical
        stackView.setCustomSpacing(32, after: labelContainerView)
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0),
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
