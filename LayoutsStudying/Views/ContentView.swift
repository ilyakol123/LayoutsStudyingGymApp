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
//        ZStack {
//            switch authViewModel.authState {
//            case .authenticated:
//                ContentView()
//                    .transition(.asymmetric(
//                                            insertion: .move(edge: .trailing).combined(with: .opacity),
//                                            removal: .move(edge: .leading).combined(with: .opacity)
//                                        ))
//            case .notAuthenticated:
//                WelcomeView()
//                    .transition(.asymmetric(
//                                            insertion: .move(edge: .leading).combined(with: .opacity),
//                                            removal: .move(edge: .trailing).combined(with: .opacity)
//                                        ))
//            case .authenticating:
//                Color.clear
//            }
//            
//            if authViewModel.authState == .authenticating {
//                AppLoadingView()
//                    .transition(.opacity)
//            }
//        }
//        .animation(.easeInOut(duration: 0.3), value: authViewModel.authState)
        
        ZStack {
                    // Фон
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    
                    // Контент
                    Group {
                        switch authViewModel.authState {
                        case .authenticated:
                            TabBarView()
                        case .notAuthenticated:
                            WelcomeView()
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
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: authViewModel.authState)
    }
}

#Preview {
    ContentView()
}
