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
        return [
            Topic(
                name: "Українська мова: погляд крізь віки",
                description: "Коли йдеться про виникнення української мови, у свідомості переважної більшості зацікавлених громадян вона часто асоціюється із сучасною літературною мовою, тобто тією, яка щодня звучить по радіо й телебаченню, яку вивчають у школах, якою друкують книжки, газети й часописи і т. ін.",
                details: "Коли йдеться про виникнення української мови, у свідомості переважної більшості зацікавлених громадян вона часто асоціюється із сучасною літературною мовою, тобто тією, яка щодня звучить по радіо й телебаченню, яку вивчають у школах, якою друкують книжки, газети й часописи і т. ін. Проте слід пам’ятати, що національна мова — це не тільки спільна для всієї нації літературна мова, опрацьована майстрами художнього слова, але й мова народна, що має діалектні відмінності на різних територіях України."
            ),
        ]
    }

    private func getCultureTopics() -> [Topic] {
        return [
            Topic(
                name: "Традиції, звичаї, обряди та святкування",
                description: "Велике значення для утвердження національної самосвідомості українців мали народні звичаї, обряди, традиції святкування, які були невід’ємною частиною повсякденного життя і стали засобом збереження української  ідентичності.",
                details: "Велике значення для утвердження національної самосвідомості українців мали народні звичаї, обряди, традиції святкування, які були невід’ємною частиною повсякденного життя і стали засобом збереження української  ідентичності. Вони відображають не тільки етнічну своєрідність, але й естетику, моральні цінності, ментальність, історію. Звичаї українського народу пов’язані з традиційним світоглядом, який складався протягом багатьох століть і зберіг ознаки дохристиянських вірувань. Зі зміною умов життя змінювалися й традиції святкування, відбувалася постійна трансформація обрядових дійств, деякі їхні елементи зникали, замінювалися іншими, але основний зміст та сакральний сенс збігалися."
            ),
        ]
    }
}
