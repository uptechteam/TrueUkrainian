//
//  TopicsProvider.swift
//  TrueUkrainian
//
//  Created by Oleksii Andriushchenko on 18.09.2022.
//

final class TopicsProvider {

    func getTopics(category: Category) -> [Topic] {
        switch category {
        case .country:
            return getCountryTopics()

        case .history:
            return getHistoryTopics()

        case .culture:
            return getCultureTopics()
        }
    }

    private func getCountryTopics() -> [Topic] {
        return [
            Topic(
                name: "Конституція України",
                description: "Основний Закон України. Ухвалений 28 червня 1996 року на 5-й сесії Верховної Ради України 2-го скликання",
                details: "Основний Закон України. Ухвалений 28 червня 1996 року на 5-й сесії Верховної Ради України 2-го скликання"
            )
        ]
    }

    private func getHistoryTopics() -> [Topic] {
        return []
    }

    private func getCultureTopics() -> [Topic] {
        return []
    }
}
