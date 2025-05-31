//
//  AppLoadingView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 22.05.2025.
//

import SwiftUI

struct AppLoadingView: View {
    var body: some View {
        ZStack {
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(2)
                        
                        Text("Загрузка...")
                            .font(.title3)
                            .padding(.top, 20)
                    }
                }
    }
}

#Preview {
    AppLoadingView()
}
