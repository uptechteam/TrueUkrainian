//
//  KnowledgeCategoryProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension KnowledgeCategoryViewController {
    static func makeProps(from state: State) -> KnowledgeCategoryView.Props {
        return .init(
            backColor: state.category.mainColor,
            items: [
                .init(title: "Конституція України", description: "Основний Закон України. Ухвалений 28 червня 1996 року на 5-й сесії Верховної Ради України 2-го скликання"),
                .init(title: "Назва 1", description: "Опис")
            ]
        )
    }
}
