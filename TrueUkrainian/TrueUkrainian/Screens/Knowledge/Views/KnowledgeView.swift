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
    private let countryCategoryView = KnowledgeCategoryTypeView()
    private let historyCategoryView = KnowledgeCategoryTypeView()
    private let cultureCategoryView = KnowledgeCategoryTypeView()
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
        countryCategoryView.addAction(UIAction(handler: { [weak self] _ in self?.onTapCategory(.country) }), for: .touchUpInside)
        historyCategoryView.configure(backgroundColor: .menuBlue, title: "Історія України")
        historyCategoryView.addAction(UIAction(handler: { [weak self] _ in self?.onTapCategory(.history) }), for: .touchUpInside)
        cultureCategoryView.configure(backgroundColor: .menuYellow, title: "Культура України")
        cultureCategoryView.addAction(UIAction(handler: { [weak self] _ in self?.onTapCategory(.culture) }), for: .touchUpInside)
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
