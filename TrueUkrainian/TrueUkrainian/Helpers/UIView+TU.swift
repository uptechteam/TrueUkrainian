//
//  UIView+TU.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

extension UIView {

    // add subview with given constraints
    func addSubview(_ otherView: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(otherView)
        otherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

    /// Insert subview with constraints below another subview
    /// - Parameters:
    ///   - view: view to be inserted
    ///   - belowSubview: the sibling view that will be above the inserted view
    ///   - constraints: constraints to active
    func insertSubview(_ view: UIView, belowSubview siblingView: UIView, constraints: [NSLayoutConstraint]) {
        view.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(view, belowSubview: siblingView)
        NSLayoutConstraint.activate(constraints)
    }

    /// Add subview with constraints based on insets
    /// - Parameters:
    ///   - otherView: view to be added
    ///   - insets: insets between view and view to be added
    ///   - isSafeAreaRequired: if true then add constraint to safe area layout guide, default is false
    ///   - isPriorityRequired: if false then trailing and bottom achors have less than requiered priority to avoid breaking constraints
    func addSubview(
        _ otherView: UIView,
        withEdgeInsets insets: UIEdgeInsets,
        isSafeAreaRequired: Bool = false,
        isPriorityRequired: Bool = true
    ) {
        addSubview(otherView, constraints: [
            otherView.topAnchor.constraint(
                equalTo: isSafeAreaRequired ? safeAreaLayoutGuide.topAnchor : topAnchor,
                constant: insets.top
            ),
            otherView.leadingAnchor.constraint(
                equalTo: isSafeAreaRequired ? safeAreaLayoutGuide.leadingAnchor : leadingAnchor,
                constant: insets.left
            ),
            otherView.trailingAnchor.constraint(
                equalTo: isSafeAreaRequired ? safeAreaLayoutGuide.trailingAnchor : trailingAnchor,
                constant: -insets.right
            )
                .prioritised(as: isPriorityRequired ? .required : .almostRequired),
            otherView.bottomAnchor.constraint(
                equalTo: isSafeAreaRequired ? safeAreaLayoutGuide.bottomAnchor : bottomAnchor,
                constant: -insets.bottom
            )
                .prioritised(as: isPriorityRequired ? .required : .almostRequired)
        ])
    }
}

extension CACornerMask {
    static let all: CACornerMask = [
        CACornerMask.layerMaxXMaxYCorner,
        CACornerMask.layerMinXMaxYCorner,
        CACornerMask.layerMaxXMinYCorner,
        CACornerMask.layerMinXMinYCorner
    ]
}

extension NSLayoutConstraint {
    func prioritised(as priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

extension UILayoutPriority {
    /// priority used for vertical and horizontal padding, width, height
    /// because initial layout and some animation need constraint for width or height of the view to be 0
    /// and this break some constraints with equal priority
    static var almostRequired: UILayoutPriority {
        return UILayoutPriority(999)
    }
}
