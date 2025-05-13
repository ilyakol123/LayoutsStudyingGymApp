//
//  CoachView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct CoachView: View {
    
    var coach: Coach
    
    var body: some View {
        
        VStack {
                Image(coach.image ?? "coachImagePlaceholder")
                    .resizable()
                    .background(Color.gray.opacity(0.4))
                    .aspectRatio(0.9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .overlay(alignment: .bottomLeading) {
//                        Text("Exp: ")
//                            .boldPart(String(
//                                format: NSLocalizedString("experience_count", comment: ""),
//                                coach.experience
//                            ))
//                                    .foregroundStyle(.indigo)
//                                    .padding(7)
//                                    .background(Color.white.opacity(0.8))
//                                    .clipShape(RoundedRectangle(cornerRadius: 30))
//                                    .padding(10)
//                                    .scaledToFit()
//                    }
                    .overlay(alignment: .topTrailing) {
                        Button {
                                    coach.isFavorite.toggle()
                                } label: {
                                    Image(systemName: coach.isFavorite  ? "heart.fill" : "heart")
                                        .padding(6)
                                        .foregroundStyle(.white)
                                        .background(Color.black.opacity(0.45))
                                        .clipShape(Circle())
                                        .padding(10)
                                }
                    }
        }
    }
}


extension Text {
    func boldPart(_ part: String) -> Text {
        self + Text(part).bold()
    }
}

#Preview {
    CoachView(coach: Coach(name: "Ekaterina", sex: .female, experience: 1, isPersonal: true, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"))
}
