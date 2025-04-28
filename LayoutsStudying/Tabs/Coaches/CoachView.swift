//
//  CoachView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct CoachView: View {
    
    @StateObject var coach: Coach
    
    var body: some View {
        
        VStack {
                Image(coach.image ?? "coachImagePlaceholder")
                    .resizable()
                    .background(Color.gray.opacity(0.4))
                    .aspectRatio(0.9, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    //.padding()
                    .overlay(alignment: .bottomLeading) {
                        Text("Exp: ")
                                    .boldPart(coach.experience > 1 ?
                                              "\(coach.experience) years" :
                                              "\(coach.experience) year")
                                    .foregroundStyle(.indigo)
                                    .padding(7)
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .padding(10)
                                    .scaledToFit()
                    }
                    .overlay(alignment: .topTrailing) {
                        Button {
                                    coach.isFavorite.toggle()
                                } label: {
                                    Image(systemName: coach.isFavorite  ? "heart.fill" : "heart")
                                        .padding(6)
                                        .foregroundStyle(.indigo)
                                        .background(Color.white.opacity(0.6))
                                        .clipShape(Circle())
                                        .padding(10)
                                }
                    }
            
                VStack {
                Text(coach.name)
                    .bold()
                Text(coach.isPersonal ? "Personal" : "Group")
                    .foregroundStyle(.secondary)
            }
        }
        //.padding(10)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension Text {
    func boldPart(_ part: String) -> Text {
        self + Text(part).bold()
    }
}

#Preview {
    CoachView(coach: Coach(name: "Ekaterina", sex: .female, experience: 3, isPersonal: true, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"))
}
