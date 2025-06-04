//
//  CoachScreenHolder.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 03.06.2025.
//

import SwiftUI

struct CoachScreenHolder: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
               // .ignoresSafeArea()
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: 250)
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(maxWidth: 40)
                }
                .frame(height: 40)
                .padding(.vertical, 5)
                .padding(.horizontal, 100)

                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 100)

                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 40)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 100)

                HStack {
                    RoundedRectangle(cornerRadius: 15)
                    RoundedRectangle(cornerRadius: 15)
                }
                .frame(height: 300)
                .padding(.vertical, 5)
                .padding(.horizontal, 100)

                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 40)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 100)

                HStack {
                    Group {
                        RoundedRectangle(cornerRadius: 15)
                        RoundedRectangle(cornerRadius: 15)
                        RoundedRectangle(cornerRadius: 15)
                        RoundedRectangle(cornerRadius: 15)
                    }
                    .frame(width: 110)
                }
                .frame(height: 150)
                .padding(.leading, 100)
                .padding(.vertical, 5)

            }
            //.background(Color.blue.opacity(0.2))
            .shimmerStyle()
        }
        .scaledToFit()
    }
}


#Preview {
    CoachScreenHolder()
}
