//
//  Coach.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import Foundation

@Observable
class Coach: Identifiable, Codable {

    var id: UUID = UUID()
    var name: String
    var sex: Sex
    var experience: Int
    var isPersonal: Bool
    var image: String?
    var isFavorite: Bool = false
    var gym: Gym
    var specialization: String
    var quote: String

    init(
        name: String,
        sex: Sex,
        experience: Int,
        isPersonal: Bool,
        image: String? = nil,
        isFavorite: Bool,
        gym: Gym,
        specialization: String,
        quote: String
    ) {
        self.name = name
        self.sex = sex
        self.experience = experience
        self.isPersonal = isPersonal
        self.image = image
        self.isFavorite = isFavorite
        self.gym = gym
        self.specialization = specialization
        self.quote = quote
    }

    private enum CodingKeys: String, CodingKey {
        case id, name, sex, experience, isPersonal, image, isFavorite, gym,
            specialization, quote
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id =
            try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.sex = try container.decode(Sex.self, forKey: .sex)
        self.experience = try container.decode(Int.self, forKey: .experience)
        self.isPersonal = try container.decode(Bool.self, forKey: .isPersonal)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        self.gym = try container.decode(Gym.self, forKey: .gym)
        self.specialization = try container.decode(
            String.self,
            forKey: .specialization
        )
        self.quote = try container.decode(String.self, forKey: .quote)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(sex.rawValue, forKey: .sex)
        try container.encode(experience, forKey: .experience)
        try container.encode(isPersonal, forKey: .isPersonal)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encode(isFavorite, forKey: .isFavorite)
        try container.encode(gym.rawValue, forKey: .gym)
        try container.encode(specialization, forKey: .specialization)
        try container.encode(quote, forKey: .quote)
    }

}

enum Sex: String, Decodable {
    case male
    case female
}

enum Gym: String, Decodable {
    case ddxPlaza
    case ddxMurino
    case ddxGallery
}
