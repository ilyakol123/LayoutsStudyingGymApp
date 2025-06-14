//
//  AuthViewModel.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 15.05.2025.
//

import FirebaseAuth
import Foundation

enum AuthFlow {
    case signIn
    case signUp
}

enum AuthState {
    case authenticated
    case notAuthenticated
    case authenticating
}

@Observable
class AuthViewModel {

    var authState: AuthState = .notAuthenticated
    var errorMessage: String = ""
    
    var user: User?
    var userDisplayedName: String = ""
    
    var userEmail: String = ""
    var isUserEmailValid: Bool {
        isEmailValid(userEmail)
    }
    var wasUserEmailEdited: Bool = false
    var shouldShowUserEmailError: Bool {
        wasUserEmailEdited && !isUserEmailValid && !userEmail.isEmpty
    }

    var userPassword: String = ""
    var isUserPasswordValid: Bool {
        isPasswordValid(password: userPassword)
    }
    var wasPasswordEdited: Bool = false
    var shouldShowPasswordError: Bool {
        wasPasswordEdited && !isUserPasswordValid && !userPassword.isEmpty
    }
    var confirmPassword: String = ""
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?

    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener {
                [weak self] auth, user in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.user = user
                    self.userDisplayedName = user?.email ?? ""
                    if user != nil {
                        self.authState = .authenticated
                    } else {
                        self.authState = .notAuthenticated
                    }
                }
            }
        }
    }
    
    func isEmailValid(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(
            format: "SELF MATCHES %@",
            #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        )
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordRegex =
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }

    init() {
        self.authState = .authenticating
        registerAuthStateHandler()
    }
}

extension AuthViewModel {
    func signInWithEmailPassword() async -> Bool {
        authState = .authenticating
        do {
            let authResult = try await Auth.auth().signIn(
                withEmail: userEmail,
                password: userPassword
            )
            user = authResult.user
            print("User \(authResult.user.uid) signed in")
            authState = .authenticated
            userDisplayedName = user?.email ?? "unknown User"
            return true
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            authState = .notAuthenticated
            return false
        }
    }

    func signUpWithEmailPassword() async -> Bool {
        authState = .authenticating
        do {
            let authResult = try await Auth.auth().createUser(
                withEmail: userEmail,
                password: userPassword
            )
            user = authResult.user
            print("Created user \(authResult.user.uid)")
            authState = .authenticated
            userDisplayedName = user?.email ?? "unknown User"
            return true
        } catch {
            print(error)
            errorMessage = error.localizedDescription
            authState = .notAuthenticated
            return false
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.authState = .notAuthenticated
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
}
