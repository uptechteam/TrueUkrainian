//
//  String+TU.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

import UIKit

extension String {
    public static func calculateTextSize(_ text: String, width: CGFloat, font: UIFont) -> CGSize {
        let nsString = NSString(string: text)
        let bounds = nsString.boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin],
            attributes: [.font: font],
            context: nil
        )
        return .init(width: ceil(bounds.width), height: ceil(bounds.height))
    }

    public static func calculateTextSize(_ text: NSAttributedString, width: CGFloat) -> CGSize {
        let bounds = text.boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin],
            context: nil
        )
        return .init(width: ceil(bounds.width), height: ceil(bounds.height))
    }
}

