//
//  ShimmerViewModifier.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 03.06.2025.
//

import SwiftUI

struct ShimmerViewModifier: ViewModifier {
    
    @State private var gradientValue: CGFloat = 0.1
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .gray, location: 0.0),
                        .init(color: .white, location: gradientValue),
                        .init(color: .gray, location: 1.0),
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .onReceive(Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()) { _ in
                
                if gradientValue < 1.0 {
                    gradientValue += 0.005
                } else {
                    gradientValue = 0.1
                }
                    
            }
    }
}
extension View {
    func shimmerStyle() -> some View {
        self.modifier(ShimmerViewModifier())
    }
}
