//
//  AuthView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 14.05.2025.
//

import FirebaseAuth
import SwiftUI

struct SignInScreen: View {

    @State private var authViewModel = AuthViewModel()
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    private var isLoginButtonDisabled: Bool {
        return !authViewModel.isUserEmailValid
            || !authViewModel.isUserPasswordValid
    }
    @Environment(\.dismiss) var dismiss
    private func signInWithEmailPassword() {
        Task {
            if await authViewModel.signInWithEmailPassword() == true {
                dismiss()
            }
        }
    }

    var body: some View {
        Form {
            VStack(spacing: 0) {
                emailField
                passwordField
            }
            Spacer()
            policyRulesField
            signInButton
        }
        .padding()
        .formStyle(.columns)
        .navigationBarTitle("Sign In")

    }
    
    private var emailField: some View {
        VStack {
            TextField("Email", text: $authViewModel.userEmail)
                .focused($isEmailFocused)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .padding()
                .background(
                    authViewModel.shouldShowUserEmailError
                        ? .red.opacity(0.2) : .indigo.opacity(0.2)
                )
                .cornerRadius(30)
                .onChange(of: isEmailFocused) { oldValue, newValue in
                    if oldValue == true && newValue == false {
                        authViewModel.wasUserEmailEdited = true
                    }
                    if oldValue == false && newValue == true {
                        authViewModel.wasUserEmailEdited = false
                    }
                }
            if authViewModel.shouldShowUserEmailError {
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
    }
    private var passwordField: some View {
        VStack {
            SecureField("Password", text: $authViewModel.userPassword)
                .focused($isPasswordFocused)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .padding()
                .background(
                    authViewModel.shouldShowPasswordError
                        ? .red.opacity(0.2) : .indigo.opacity(0.2)
                )
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
        }
    }
    private var policyRulesField: some View {
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
    }
    private var signInButton: some View {
        Button(action: signInWithEmailPassword) {
            if authViewModel.authState != .authenticating {
                Text("Login")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        isLoginButtonDisabled
                            ? Color.indigo.opacity(0.5) : Color.indigo
                    )
                    .foregroundStyle(.white)
                    .cornerRadius(30)
            } else {
                ProgressView()
                    .progressViewStyle(
                        CircularProgressViewStyle(tint: .white)
                    )
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }

        }
        .disabled(isLoginButtonDisabled)
    }
}

#Preview {
    SignInScreen()
}
