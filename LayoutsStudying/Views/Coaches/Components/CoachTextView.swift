//
//  CoachTextView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import SwiftUI

struct CoachTextView: View {
    var coach: Coach
    
    var body: some View {
        VStack(alignment: .leading) {
        Text(coach.name)
                .font(.system(size: 16, weight: .heavy))
        Text(coach.isPersonal ? "Personal" : "Group")
            .foregroundStyle(.secondary)
    }
    }
}

#Preview {
    CoachTextView(coach: Coach(name: "Ekaterina", sex: .female, experience: 1, isPersonal: true, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"))
}
