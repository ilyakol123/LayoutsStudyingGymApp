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
                NavigationStack {
                    MainTabView()
                }
            }
            Tab("Schedule", systemImage: "calendar") {
                NavigationStack {
                    CalendarTabView()
                }
                
            }
            Tab("Coaches", systemImage: "dumbbell") {
                NavigationStack {
                    CoachesTabView()
                }
            }
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                NavigationStack {
                    ProfileTabView()
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}
