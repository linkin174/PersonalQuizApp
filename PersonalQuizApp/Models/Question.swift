//
//  Question.swift
//  PersonalQuizApp
//
//  Created by Aleksandr Kretov on 15.03.2022.
//

import Foundation

struct Question {
    let title: String
    let resposeType: ResponseType
    let answers: [Answer]

    static func getQuestions() -> [Question] {
        [
            Question(title: "Какую пищу вы предпочитаете?",
                     resposeType: .single,
                     answers: [
                         Answer(title: "Стейк", animal: .dog),
                         Answer(title: "Рыба", animal: .cat),
                         Answer(title: "Морковь", animal: .rabbit),
                         Answer(title: "Кукуруза", animal: .turtle)
                     ]),

            Question(title: "Что вам нравится больше?",
                     resposeType: .multiple,
                     answers: [
                Answer(title: "Плавать", animal: .dog),
                Answer(title: "Спать", animal: .cat),
                Answer(title: "Обнимать", animal: .rabbit),
                Answer(title: "Есть", animal: .turtle)
            ]),

            Question(title: "Любите ли вы поездки на авто?",
                     resposeType: .ranged,
                     answers: [
                Answer(title: "Ненавижу", animal: .turtle),
                Answer(title: "Нервничаю", animal: .rabbit),
                Answer(title: "Не замечаю", animal: .cat),
                Answer(title: "Обожаю", animal: .dog)
            ])
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer: Hashable {
    let title: String
    let animal: Animal
}

enum Animal: Character, Hashable {
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"

    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях"
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии"
        }
    }
}
