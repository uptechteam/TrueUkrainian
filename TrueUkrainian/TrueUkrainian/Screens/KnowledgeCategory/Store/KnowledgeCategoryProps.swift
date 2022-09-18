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
            items: makeItems(state: state)
        )
    }

    private static func makeItems(state: State) -> [KnowledgeCategoryCell.Props] {
        return state.topics.map { topic in
            return KnowledgeCategoryCell.Props(title: topic.name, description: topic.description)
        }
    }
}
