//
//  ProfileProps.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 17.09.2022.
//

extension ProfileViewController {
    static func makeProps(from state: State) -> ProfileView.Props {
        .init(
            resultViewProps: ProfileResultView.Props(quizCount: 12, pointsCount: 2890),
            profileRatingProps: ProfileRatingView.Props(progress: 0.6)
        )
    }
}
