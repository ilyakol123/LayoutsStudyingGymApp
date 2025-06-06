//
//  WelcomeView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 14.05.2025.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundImage

                VStack(alignment: .center) {
                    Spacer()
                    contactSupportField
                    signInButton
                    signUpButton
                    skipButton

                }
                .padding()

            }
        }

    }
    
    private var contactSupportField: some View {
        VStack {
            Text("Problems with app?")
            HStack(spacing: 0) {

                Text("Contact ")
                Link(
                    "Support",
                    destination: URL(string: "https://example.com")!
                )
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
    }
    private var signInButton: some View {
        NavigationLink {
            SignInScreen()
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
    }
    private var signUpButton: some View {
        NavigationLink {
            SignUpScreen()
        } label: {
            Text("Sign Up")
                .bold()
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
        .padding(.horizontal)
    }
    private var skipButton: some View {
        NavigationLink {
           TabBarView()
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
    private var backgroundImage: some View {
        Image("authBackgoundImage")
            .resizable()
            .ignoresSafeArea(edges: .all)
            .scaledToFill()
    }
}

#Preview {
    WelcomeScreen()
}
