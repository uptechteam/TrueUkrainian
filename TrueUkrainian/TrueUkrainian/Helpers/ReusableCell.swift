//
//  ReusableCell.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    public static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

