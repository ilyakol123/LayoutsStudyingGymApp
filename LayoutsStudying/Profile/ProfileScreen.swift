//
//  ProfileScreen.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 30.05.2025.
//

import FirebaseAuth
import SwiftUI

struct ProfileScreen: View {
    private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {

            Form {
                Text("uid:  \(authViewModel.user?.uid ?? "missing uid")")
                Text("email: \(authViewModel.user?.email ?? "missing email")")
            }

//            Button(action: authViewModel.signOut) {
//                Text("Sign Out")
//            }
            Button {
                authViewModel.signOut()
                
            } label: {
                Text("Sign Out")
            }
            .buttonStyle(.bordered)
        }

    }
}

#Preview {
    ProfileScreen()
}
