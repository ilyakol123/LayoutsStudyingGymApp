//
//  CarouselView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 04.06.2025.
//

import SwiftUI

struct CarouselView: View {
    let items = [
        PromoCardView(
            text: """
                Your favorite trainings,
                fresh air and top artists.
                Come up!
                """,
            buttonText: "Buy a ticket",
            titleText: "DDX Fitness FEST",
            image: Image("promoGirl1"),
            backgroundColor: Color(
                red: 5 / 255,
                green: 62 / 255,
                blue: 69 / 255
            )
        ),
        PromoCardView(
            text: """
                15 directions, 100+ trainings
                - you'll find that suits you
                """,
            buttonText: "Find more",
            titleText: """
                Online Trainings
                DDX Action
                """,
            image: Image("promoGirl2"),
            backgroundColor: Color(
                red: 134 / 255,
                green: 230 / 255,
                blue: 212 / 255
            )
        ),
    ]
    @State private var currentIndex = 0
    @State private var dragOffset: CGFloat = 0

    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width * 0.9
            let spacing: CGFloat = 10
            let leadingOffset: CGFloat = (geometry.size.width - itemWidth) / 2
            let fullItemWidth = itemWidth + spacing

            HStack(spacing: spacing) {
                ForEach(items.indices, id: \.self) { index in
                    items[index]
                        .frame(width: itemWidth)
                }
            }
            .padding(.horizontal, leadingOffset)
            .offset(x: -CGFloat(currentIndex) * fullItemWidth + dragOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        dragOffset = gesture.translation.width
                    })
                    .onEnded({ gesture in
                        let treshold: CGFloat = itemWidth / 2
                        var newIndex = currentIndex

                        if gesture.translation.width > treshold {
                            newIndex = max(currentIndex - 1, 0)
                        } else if gesture.translation.width < -treshold {
                            newIndex = min(currentIndex + 1, items.count - 1)
                        }
                        withAnimation {
                            currentIndex = newIndex
                            dragOffset = 0
                        }
                    })
            )
            .onReceive(timer) { _ in
                withAnimation {
                    if currentIndex < items.count - 1 {
                        currentIndex += 1
                    } else {
                        currentIndex = 0
                    }
                }

            }

        }
        .frame(height: 220)
        //.frame(maxWidth: .infinity, maxHeight: 220)

    }
}

#Preview {
    CarouselView()
}
