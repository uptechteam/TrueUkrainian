//
//  Category.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import Foundation
import UIKit

enum Category: Equatable {
    case country
    case history
    case culture

    var mainColor: UIColor {
        switch self {
        case .country:
            return .menuGreen

        case .history:
            return .menuBlue

        case .culture:
            return .menuYellow
        }
    }
}
