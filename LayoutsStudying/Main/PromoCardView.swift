//
//  PromoCardView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 05.06.2025.
//

import SwiftUI

struct PromoCardView: View {
    var text: String
    var buttonText: String
    var titleText: String
    var image: Image
    
    var backgroundColor: Color

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                let imageWidth = geometry.size.width / 2
                let imageHeight = geometry.size.height * 1.25

                RoundedRectangle(cornerRadius: 20)
                    .fill(backgroundColor)

                ZStack {
                    image
                        .resizable()
                        .offset(y: 10)
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .zIndex(0)
                        //.background(.red)
                        .position(
                            x: geometry.size.width - imageWidth / 2.4,
                            y: geometry.size.height - (imageHeight / 2)
                        )

                    VStack(alignment: .leading, spacing: 12) {
                        Text(titleText)
                            .font(.title).bold()
                            .foregroundStyle(.white)

                        Text(text)
                            .foregroundStyle(.white)

                        Button {

                        } label: {
                            Text(buttonText)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 7)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        .padding(.top, 8)

                        Spacer()
                    }
                    .padding(.leading, geometry.size.width * 0.05)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(1)
                }
            }
            .frame(height: 220)
        }
    }
}

#Preview {
    PromoCardView(
        text: """
            Your favorite trainings,
            fresh air and top artists.
            Come up!
            """,
        buttonText: "Buy a ticket",
        titleText: "DDX Fitness FEST",
        image: Image("promoGirl2"),
        backgroundColor: Color(red: 5 / 255, green: 62 / 255, blue: 69 / 255)
    )
}
