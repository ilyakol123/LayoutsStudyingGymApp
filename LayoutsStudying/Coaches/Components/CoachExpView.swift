//
//  CoachExpView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import SwiftUI

struct CoachExpView: View {

    var coach: Coach

    var body: some View {
        Text("Exp: ")
            .boldPart(
                String(
                    format: NSLocalizedString("experience_count", comment: ""),
                    coach.experience
                )
            )
            .foregroundStyle(.indigo)
            .padding(7)
            .background(Color.white.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(10)
            .scaledToFit()
    }
}

#Preview {
    CoachExpView(
        coach: Coach(
            name: "Ekaterina",
            sex: .female,
            experience: 1,
            isPersonal: true,
            isFavorite: true,
            gym: .ddxPlaza,
            specialization: "testSpec1",
            quote: "testQuote1"
        )
    )
}
