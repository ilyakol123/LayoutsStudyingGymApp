//
//  ContentView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct ContentView: View {
    private var authViewModel = AuthViewModel()

    var body: some View {
        ZStack {
            Group {
                switch authViewModel.authState {
                case .authenticated:
                    TabBarView()
                case .notAuthenticated:
                    WelcomeScreen()
                case .authenticating:
                    EmptyView()
                }
            }
            .transition(.opacity.combined(with: .scale(scale: 0.95)))

            // Загрузка
            if authViewModel.authState == .authenticating {
                AppLoadingView()
                    .transition(.opacity)
            }
        }
        .animation(
            .spring(response: 0.4, dampingFraction: 0.8),
            value: authViewModel.authState
        )
    }
}

#Preview {
    ContentView()
}
