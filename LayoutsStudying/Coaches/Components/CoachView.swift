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
