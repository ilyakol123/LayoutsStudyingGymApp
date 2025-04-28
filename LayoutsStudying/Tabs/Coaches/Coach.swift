//
//  Coach.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import Foundation

class Coach: Identifiable, ObservableObject {
    var name: String
    var sex: Sex
    var experience: Int
    var isPersonal: Bool
    var image: String?
    @Published var isFavorite: Bool = false
    var gym: Gym
    var specialization: String
    var quote: String
    
    init(name: String, sex: Sex, experience: Int, isPersonal: Bool, image: String? = nil, isFavorite: Bool, gym: Gym, specialization: String, quote: String) {
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
}

enum Sex: String {
    case male
    case female
}

enum Gym: String {
    case ddxPlaza
    case ddxMurino
    case ddxGallery
}
