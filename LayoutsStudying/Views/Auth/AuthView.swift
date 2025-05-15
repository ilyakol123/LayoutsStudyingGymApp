//
//  AuthView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 14.05.2025.
//

import SwiftUI

struct AuthView: View {

    @State private var authViewModel = AuthViewModel()
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool

    var body: some View {
        Form {
            VStack(spacing: 0) {
                VStack {
                    TextField("Email", text: $authViewModel.email)
                        .focused($isEmailFocused)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(authViewModel.shouldShowEmailError ? .red.opacity(0.2) : .indigo.opacity(0.2))
                        .cornerRadius(30)
                        .onChange(of: isEmailFocused) { oldValue, newValue in
                            if oldValue == true && newValue == false {
                                authViewModel.wasEmailEdited = true
                            }
                            if oldValue == false && newValue == true {
                                authViewModel.wasEmailEdited = false
                            }
                        }
                    
                    if authViewModel.shouldShowEmailError {
                        HStack {
                            Text("Incorrect e-mail")
                                .foregroundStyle(.red)
                                .font(.caption)
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                    }
                }
                .padding(.bottom)
                
                VStack {
                    TextField("Password", text: $authViewModel.password)
                        .focused($isPasswordFocused)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(authViewModel.shouldShowPasswordError ? .red.opacity(0.2) : .indigo.opacity(0.2))
                        .cornerRadius(30)
                        .onChange(of: isPasswordFocused) { oldValue, newValue in
                            if oldValue == true && newValue == false {
                                authViewModel.wasPasswordEdited = true
                            }
                            if oldValue == false && newValue == true {
                                authViewModel.wasPasswordEdited = false
                            }
                        }
                    
                    if authViewModel.shouldShowPasswordError {
                        HStack {
                            Text("Not matching the password rules")
                                .foregroundStyle(.red)
                                .font(.caption)
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password should conform to the following rules:")
                        Text("• symbols and numbers required")
                        Text("• at least 8 digits")
                        Text("• at least 1 big letter")
                        Text("• at least 1 special symbol")
                    }
                        .font(.caption)
                        .padding(.leading, -60)
                }
                

            }
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
            .contentShape(RoundedRectangle(cornerRadius: 30))

            Spacer()
            VStack {

                Text("Entering credentials, you are accepting ")
                Link(
                    "Personal Privacy Policy Rules",
                    destination: URL(string: "https://example.com")!
                )
                .foregroundColor(.indigo)
            }
            .font(.caption)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black.opacity(0.4))
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal)

            Button {
                //login
            } label: {
                Text("Login")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.indigo)
                    .foregroundStyle(.white)
                    .cornerRadius(30)

            }
        }
        .padding()
        .formStyle(.columns)
        .navigationBarTitle("Auth or Register")

    }
}

#Preview {
    AuthView()
}
