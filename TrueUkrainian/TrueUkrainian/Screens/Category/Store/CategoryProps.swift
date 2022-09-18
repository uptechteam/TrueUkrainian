//
//  CategoryProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

extension CategoryViewController {
    static func makeProps(from state: State) -> CategoryView.Props {
        return .init(
            backgroundColor: state.category.mainColor,
            description: makeDescription(state: state)
        )
    }

    private static func makeDescription(state: State) -> String {
        switch state.category {
        case .country:
            return "Опис"

        case .history:
            return """
Історія земель сучасної України, українського народу та інших національностей, що проживають на території України, від доісторичних часів до сьогодення.
"""

        case .culture:
            return "Опис"
        }
    }
}
