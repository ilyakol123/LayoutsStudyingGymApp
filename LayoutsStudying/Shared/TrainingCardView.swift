//
//  TrainingCardView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 11.06.2025.
//

import SwiftUI

struct TrainingCardView: View {
    var training: Training

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(training.date.hour!):\(training.date.minute!)")
                    .foregroundStyle(.indigo)
                Text("\(training.durationInMin) min")
                    .foregroundStyle(.indigo.opacity(0.6))
            }
            .bold()

            Text(training.name)
                .font(.title)
                .bold()
                .padding(.vertical, 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location")
                        .frame(width: 24, height: 24)
                    Text(training.gym.rawValue)
                }

                HStack {
                    Image(training.coach.image ?? "coachImagePlaceholder")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .clipShape(.circle)
                        .frame(width: 24, height: 24)
                    Text(training.coach.name)
                }
            }
            
            
            HStack {
                Text("Available \(training.bookedPlaces) from \(training.availablePlaces) places")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
            .padding(.horizontal)

        }
        .padding()
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
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
}
