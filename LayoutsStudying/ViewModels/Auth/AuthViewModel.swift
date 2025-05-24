//
//  AuthViewModel.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 15.05.2025.
//

import Foundation
import FirebaseAuth

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
class AuthViewModel{
    
    var email: String = ""
    var isEmailValid: Bool {
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@",
                 #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#)
            return emailPredicate.evaluate(with: email)
        }
    var wasEmailEdited: Bool = false
    var shouldShowEmailError: Bool {
        wasEmailEdited && !isEmailValid && !email.isEmpty
    }
    
    var password: String = ""
    var isPasswordValid: Bool {
            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordTest.evaluate(with: password)
        }
    var wasPasswordEdited: Bool = false
    var shouldShowPasswordError: Bool {
        wasPasswordEdited && !isPasswordValid && !password.isEmpty
    }
    var confirmPassword: String = ""
    
    var flow: AuthFlow = .signIn
    
    var user: User?
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?

    func registerAuthStateHandler() {
        if authStateHandler == nil {
          authStateHandler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
              guard let self = self else { return }
              
              DispatchQueue.main.async {
                  self.user = user
                  self.displayName = user?.email ?? ""
                  
                  if user != nil {
                      self.authState = .authenticated
                  } else {
                      self.authState = .notAuthenticated
                  }
              }
          }
        }
      }
    
    func switchFlow() {
        flow = flow == .signIn ? .signUp : .signIn
        errorMessage = ""
      }
    
    init() {
        self.authState = .authenticating
        
        registerAuthStateHandler()
    }
    
    var authState: AuthState = .notAuthenticated
    var errorMessage: String = ""
    var displayName: String = ""
}

extension AuthViewModel {
    func signInWithEmailPassword() async -> Bool {
        authState = .authenticating
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
            print("User \(authResult.user.uid) signed in")
            authState = .authenticated
            displayName = user?.email ?? "unknown User"
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
              let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
              user = authResult.user
              print("Created user \(authResult.user.uid)")
              authState = .authenticated
              displayName = user?.email ?? "unknown User"
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
              }
              catch {
                print(error)
                errorMessage = error.localizedDescription
              }
      }
}
