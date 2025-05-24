//
//  Card.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 22.05.2025.
//

import SwiftUI

// 1. We give our struct a generic parameter clause requiring a type conforming to View
struct Card <Content : View> : View {
    
    // 2. The actual parameter of our generic type
    let content: Content
    
    // 3. Our init takes a closure that returns our generic View type, and uses @ViewBuilder to allow for convenient DSL syntax
    init(@ViewBuilder contentBuilder: () -> Content){
        self.content = contentBuilder()
    }
    
    init() where Content == Color {
        self.init {
            Color.yellow
        }
    }
    
    // 4. We simply return our "content" parameter, with the modifiers applied to make it look like a card
    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(8.0)
            .shadow(color: .gray, radius: 10, x: 5, y: 5)
    }
}

#Preview {
    Card{
        Text("hello")
    }
        .padding()
}
