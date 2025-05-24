//
//  MainView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct MainTabView : View {
    
    var body: some View {
        ZStack {
            Text("Main")
                        .padding(100)
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .shadow(color: .gray, radius: 10, x: 5, y: 5)
        }
        
        
    }
}

#Preview {
    MainTabView()
}
