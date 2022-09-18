//
//  ProfileProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension ProfileViewController {
    static func makeProps(from state: State) -> ProfileView.Props {
        .init(resultViewProps: ResultView.Props(quizCount: 12, pointsCount: 2890))
    }
}
