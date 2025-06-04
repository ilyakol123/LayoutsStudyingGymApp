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
            Tab("Coaches", systemImage: "dumbbell") {
                NavigationStack {
                    CoachesScreen()
                }
            }
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                NavigationStack {
                    ProfileScreen()
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}
