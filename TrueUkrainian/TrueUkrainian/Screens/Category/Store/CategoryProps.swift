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
            return """
            Механізм роботи державної влади, освновних її огранів. Розподілення влади на різних рівнях (кабінец міністрів, органи місцевого самоврядування)
            """

        case .history:
            return """
Історія земель сучасної України, українського народу та інших національностей, що проживають на території України, від доісторичних часів до сьогодення.
"""

        case .culture:
            return "Цікаві традиції, духовна спадшища, неймовірні факти та генії української культури. "
        }
    }
}
