//
//  UserScheduleView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 10.06.2025.
//

import SwiftUI

struct ExpandingView<Content: View>: View {
    @State var isExpanded: Bool = false
    var title: String
    let hiddenView: Content

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                    .bold()

                Spacer()

                Button {
                    withAnimation(.easeInOut(duration: 5)) {
                        isExpanded.toggle()
                    }

                } label: {
                    ZStack {
                        Image(
                            systemName: "chevron.down"
                        )
                        .foregroundStyle(.black)
                        .rotationEffect(
                            isExpanded ? .degrees(0) : .degrees(180)
                        )
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 32, height: 32)
                    }

                }
            }
            .padding()

            VStack {
                hiddenView
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: isExpanded ? nil : 0)
            .opacity(isExpanded ? 1 : 0)
            .clipped()
            //.animation(.easeInOut(duration: 0.3), value: isExpanded)
            Spacer()
        }
    }
}

#Preview {
    ExpandingView(
        title: "Your Schedule",
        hiddenView: Text(
            """
            Expanded content
            asd
            asd
            as
            da
            sd
            asd
            """
        )
    )
}
