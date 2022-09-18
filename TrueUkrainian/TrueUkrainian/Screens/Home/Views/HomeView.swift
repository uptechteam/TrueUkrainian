//
//  HomeView.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

final class HomeView: UIView {

    struct Props: Equatable {

    }

    // MARK: - Properties

    private let titleLabel = UILabel()
    private let categoriesLabel = UILabel()
    private let countryView = HomeCategoryView()
    private let historyView = HomeCategoryView()
    private let cultureView = HomeCategoryView()
    // callbacks
    var onTapCountry: () -> Void = { }
    var onTapHistory: () -> Void = { }
    var onTapCulture: () -> Void = { }

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
        setupCategoriesLabel()
        setupCategories()
        setupStackView()
    }

    private func setupContentView() {
        backgroundColor = .bg
    }

    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = .mainText
        titleLabel.text = "Нумо Розумнішати!"
    }

    private func setupCategoriesLabel() {
        categoriesLabel.font = .systemFont(ofSize: 16, weight: .medium)
        categoriesLabel.textColor = .secondaryText
        categoriesLabel.text = "Категорії Вікторини"
    }

    private func setupCategories() {
        countryView.configure(backgroundColor: .menuGreen, title: "Держава", desc: "Структура державної влади", icon: .countryIcon, quiz: "1 вікторина", questions: "10 питань")
        countryView.addAction(UIAction(handler: { [weak self] _ in self?.onTapCountry() }), for: .touchUpInside)
        historyView.configure(backgroundColor: .menuBlue, title: "Історія України", desc: "Історія української землі і українського народу", icon: .historyIcon, quiz: "1 вікторина", questions: "10 питань")
        historyView.addAction(UIAction(handler: { [weak self] _ in self?.onTapHistory() }), for: .touchUpInside)
        cultureView.configure(backgroundColor: .menuYellow, title: "Культура України", desc: "Особливості культури нашої країни", icon: .cultureIcon, quiz: "1 вікторина", questions: "10 питань")
        cultureView.addAction(UIAction(handler: { [weak self] _ in self?.onTapCulture() }), for: .touchUpInside)
    }

    private func setupStackView() {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, categoriesLabel, countryView, historyView, cultureView, UIView()]
        )
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.setCustomSpacing(32, after: titleLabel)
        addSubview(
            stackView,
            withEdgeInsets: UIEdgeInsets(top: 32, left: 24, bottom: 24, right: 24),
            isSafeAreaRequired: true
        )
    }

    // MARK: - Public methods

    func render(props: Props) {

    }
}
