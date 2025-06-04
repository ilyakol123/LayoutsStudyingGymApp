//
//  GreedCoachesView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 13.05.2025.
//

import SwiftUI

struct CoachesGreedScreen: View {

    var coaches: [Coach]
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    @State var showFilterSheet: Bool = false

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(coaches) { coach in
                    VStack {
                        CoachView(coach: coach)
                            .overlay(alignment: .bottomLeading) {
                                CoachExpView(coach: coach)
                            }
                        HStack {
                            CoachTextView(coach: coach)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.bottom)
                }
            }
            .padding()
        }
        .navigationTitle("Personal coaches")
        .toolbar {
            Button {
                showFilterSheet.toggle()
            } label: {
                Image(systemName: "slider.vertical.3")
            }
        }
        .sheet(isPresented: $showFilterSheet) {
            FiltersView(showFilterSheet: $showFilterSheet, coaches: coaches)
        }

    }
}

#Preview {
    let coaches = [
        Coach(
            name: "Ekaterina",
            sex: .female,
            experience: 3,
            isPersonal: true,
            image: "coach1",
            isFavorite: false,
            gym: .ddxPlaza,
            specialization: "testSpec1",
            quote: "testQuote1"
        ),
        Coach(
            name: "Dmitriy",
            sex: .male,
            experience: 5,
            isPersonal: false,
            isFavorite: true,
            gym: .ddxPlaza,
            specialization: "testSpec2",
            quote: "testQuote2"
        ),
        Coach(
            name: "Julia",
            sex: .female,
            experience: 1,
            isPersonal: true,
            image: "coach3",
            isFavorite: false,
            gym: .ddxMurino,
            specialization: "testSpec3",
            quote: "testQuote3"
        ),
        Coach(
            name: "Ekaterina",
            sex: .female,
            experience: 3,
            isPersonal: true,
            image: "coach1",
            isFavorite: false,
            gym: .ddxPlaza,
            specialization: "testSpec1",
            quote: "testQuote1"
        ),
        Coach(
            name: "Dmitriy",
            sex: .male,
            experience: 5,
            isPersonal: false,
            isFavorite: true,
            gym: .ddxPlaza,
            specialization: "testSpec2",
            quote: "testQuote2"
        ),
        Coach(
            name: "Julia",
            sex: .female,
            experience: 1,
            isPersonal: true,
            image: "coach3",
            isFavorite: false,
            gym: .ddxMurino,
            specialization: "testSpec3",
            quote: "testQuote3"
        ),
        Coach(
            name: "Ekaterina",
            sex: .female,
            experience: 3,
            isPersonal: true,
            image: "coach1",
            isFavorite: false,
            gym: .ddxPlaza,
            specialization: "testSpec1",
            quote: "testQuote1"
        ),
        Coach(
            name: "Dmitriy",
            sex: .male,
            experience: 5,
            isPersonal: false,
            isFavorite: true,
            gym: .ddxPlaza,
            specialization: "testSpec2",
            quote: "testQuote2"
        ),
        Coach(
            name: "Julia",
            sex: .female,
            experience: 1,
            isPersonal: true,
            image: "coach3",
            isFavorite: false,
            gym: .ddxMurino,
            specialization: "testSpec3",
            quote: "testQuote3"
        ),
        Coach(
            name: "Ekaterina",
            sex: .female,
            experience: 3,
            isPersonal: true,
            image: "coach1",
            isFavorite: false,
            gym: .ddxPlaza,
            specialization: "testSpec1",
            quote: "testQuote1"
        ),
        Coach(
            name: "Dmitriy",
            sex: .male,
            experience: 5,
            isPersonal: false,
            isFavorite: true,
            gym: .ddxPlaza,
            specialization: "testSpec2",
            quote: "testQuote2"
        ),
        Coach(
            name: "Julia",
            sex: .female,
            experience: 1,
            isPersonal: true,
            image: "coach3",
            isFavorite: false,
            gym: .ddxMurino,
            specialization: "testSpec3",
            quote: "testQuote3"
        ),
    ]
    CoachesGreedScreen(coaches: coaches)
}
