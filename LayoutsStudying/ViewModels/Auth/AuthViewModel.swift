//
//  AuthViewModel.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 15.05.2025.
//

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
    
    
    
    var authState: AuthState = .notAuthenticated
    var errorMessage: String = ""
    var displayName: String = ""
}
