//
//  TabBarView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {

            Tab("Main", systemImage: "house") {
                    MainScreen()
            }

            Tab("Coaches", systemImage: "dumbbell") {
                    CoachesScreen()
            }
            
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                    ProfileScreen()
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    TabBarView()
}
