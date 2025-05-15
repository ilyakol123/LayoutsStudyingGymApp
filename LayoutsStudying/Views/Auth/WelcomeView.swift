//
//  WelcomeView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 14.05.2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("authBackgoundImage")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .scaledToFill()
            
            VStack(alignment: .center) {
                Spacer()
                
                VStack {
                    Text("Problems with app?")
                    HStack(spacing: 0) {
                        
                        Text("Contact ")
                        Link("Support", destination: URL(string: "https://example.com")!)
                            .foregroundColor(.indigo)
                    }
                }
                .font(.caption)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.opacity(0.6))
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.horizontal)
                
                Button {
                    //to auth view
                } label: {
                    Text("Sign In")
                        .bold()
                        .contentShape(Rectangle())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                    .padding(.horizontal)
                    
                
                Button {
                    //skip auth view move to tab view with no profile
                } label: {
                    Text("Skip")
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                    .padding(.horizontal)
            }
            .padding()
            
            
        }
    }
}

#Preview {
    WelcomeView()
}
