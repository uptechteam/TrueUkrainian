//
//  Coordinating.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

import UIKit

protocol Coordinating: AnyObject {
    var rootViewController: UIViewController { get }

    func start()
}
