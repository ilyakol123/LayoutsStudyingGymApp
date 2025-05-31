//
//  SignUpView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 22.05.2025.
//

import SwiftUI

struct SignUpScreen: View {

    @Environment(\.dismiss) var dismiss
    @State private var authViewModel = AuthViewModel()
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool

    private var isLoginButtonDisabled: Bool {
        return !authViewModel.isUserEmailValid
            || !authViewModel.isUserPasswordValid
    }

    private func signUpWithEmailPassword() {
        Task {
            if await authViewModel.signUpWithEmailPassword() == true {
                dismiss()
            }
        }
    }

    var body: some View {
        Form {
            VStack(spacing: 0) {
                VStack {
                    emailField
                    if authViewModel.shouldShowUserEmailError {
                        emailErrorMessage
                    }
                }
                .padding(.bottom)
                
                VStack {
                    passwordField
                    if authViewModel.shouldShowPasswordError {
                        passwordErrorMessage
                    }
                }
                passwordRulesText
            }
            Spacer()
            policyRulesField
            signUpButton
        }
        .padding()
        .formStyle(.columns)
        .navigationBarTitle("Sign Up")

    }

    private var emailField: some View {
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
    }

    private var emailErrorMessage: some View {
        HStack {
            Text("Incorrect e-mail")
                .foregroundStyle(.red)
                .font(.caption)
                .padding(.leading)
            Spacer()
        }
        .padding(.bottom, 2)
    }

    private var passwordField: some View {
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
    }

    private var passwordErrorMessage: some View {
        HStack {
            Text("Not matching the password rules")
                .foregroundStyle(.red)
                .font(.caption)
                .padding(.leading)
            Spacer()
        }
        .padding(.bottom, 5)
    }

    private var passwordRulesText: some View {
        VStack(alignment: .leading) {
            Text("Password should conform to the following rules:")
            Text("• symbols and numbers required")
            Text("• at least 8 digits")
            Text("• at least 1 big letter")
            Text("• at least 1 special symbol")
        }
        .font(.caption)
        .padding(.leading, -60)
        .padding(.top)
        .foregroundStyle(.gray)
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

    private var signUpButton: some View {
        Button(action: signUpWithEmailPassword) {
            if authViewModel.authState != .authenticating {
                Text("Sign Up")
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
    SignUpScreen()
}
