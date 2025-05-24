//
//  ProfileTabView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI
import FirebaseAuth

struct ProfileTabView: View {
    private var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            
            Form {
                Text("uid:  \(authViewModel.user?.uid ?? "missing uid")")
                Text("email: \(authViewModel.user?.email ?? "missing email")")
            }
            
            Button(action: authViewModel.signOut) {
                Text("Sign Out")
            }
            .buttonStyle(.bordered)
        }
        
        
        
    }
}

#Preview {
    ProfileTabView()
}
