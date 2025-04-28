//
//  TabBarView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            Tab("Main", systemImage: "house") {
                MainTabView()
            }
            Tab("Schedule", systemImage: "calendar") {
                CalendarTabView()
            }
            Tab("Coaches", systemImage: "dumbbell") {
                CoachesTabView()
            }
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                ProfileTabView()
            }
        }
    }
}

#Preview {
    TabBarView()
}
