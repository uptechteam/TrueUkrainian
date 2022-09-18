//
//  TopicDetailsProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension TopicDetailsViewController {
    static func makeProps(from state: State) -> TopicDetailsView.Props {
        return .init(
            backColor: state.category.mainColor,
            title: state.topic.name,
            details: state.topic.details
        )
    }
}
