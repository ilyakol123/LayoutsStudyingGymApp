//
//  MainScreen.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 04.06.2025.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        Form {
            Text("Test")
                .padding()

            CarouselView()
                .padding(.vertical)

            Text("Test")
                .padding()

            ExpandingView(
                title: "Your Schedule",
                hiddenView:
                    TrainingCardView(
                        training: Training(
                            name: "Step 45",
                            durationInMin: 45,
                            description: "Stepping training",
                            date: DateComponents(
                                calendar: Calendar.current,
                                year: 2025,
                                month: 6,
                                day: 10,
                                hour: 14,
                                minute: 30
                            ),
                            coach: Coach(
                                name: "Natalya Chernova",
                                sex: .female,
                                experience: 3,
                                isPersonal: false,
                                image: "coach1",
                                isFavorite: false,
                                gym: .ddxPlaza,
                                specialization: "Yoga",
                                quote: "Go go go",

                            ),
                            availablePlaces: 6,
                            bookedPlaces: 1,
                            gym: .ddxPlaza
                        )
                    )
            )
            .padding()

            Spacer()
        }
        .formStyle(.columns)

    }
}

#Preview {
    MainScreen()
}
