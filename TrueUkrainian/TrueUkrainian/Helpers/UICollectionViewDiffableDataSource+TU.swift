//
//  UICollectionViewDiffableDataSource+TU.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

extension UICollectionViewDiffableDataSource {
    public func apply(
        sections: [SectionIdentifierType],
        items: [[ItemIdentifierType]],
        animatingDifferences: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType>()
        var itemsBySection: [SectionIdentifierType: [ItemIdentifierType]] = [:]
        for (section, sectionItems) in zip(sections, items) {
            itemsBySection[section] = sectionItems
        }

        let uniqueSections = getUniqueItems(from: sections)
        snapshot.appendSections(uniqueSections)

        for section in uniqueSections {
            let uniqueItems = getUniqueItems(from: itemsBySection[section]!)
            snapshot.appendItems(uniqueItems, toSection: section)
        }

        apply(snapshot, animatingDifferences: animatingDifferences, completion: completion)
    }

    func getUniqueItems<T>(from items: [T]) -> [T] where T: Hashable {
        var uniqueItems = [T]()
        var usedItems = Set<T>()
        for item in items {
            if !usedItems.contains(item) {
                usedItems.insert(item)
                uniqueItems.append(item)
            } else {
                print("Data item with duplicated identifier found. Item: \(item)")
            }
        }
        return uniqueItems
    }
}

