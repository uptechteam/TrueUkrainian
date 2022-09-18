//
//  QuestionProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

extension QuestionViewController {
    static func makeProps(from state: State) -> QuestionView.Props {
        return .init(
            progress: 0.5,
            buttonTitle: "Обери відповідь"
        )
    }
}
