//
//  LoginView.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 20/04/2023.
//

import SwiftUI

struct LoginState {
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        emailError = nil
        passwordError = nil
    }
    
    mutating func isValid() -> Bool {
        if email.isEmpty {
            emailError = .emailEmpty
        } else if !email.isValidEmail {
            emailError = .emailInvalid
        }
        
        if password.isEmpty {
            passwordError = .passwordEmpty
        }
        
        return emailError == nil && passwordError == nil
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    @State private var loginState = LoginState()
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    private var isFormValid: Bool {
        //!email.isEmpty && !password.isEmpty && email.isValidEmail
        
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required!"
        } else if !email.isValidEmail {
            loginFormError.email = "Email is in the wrong format!"
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required!"
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $loginState.email)
                .textInputAutocapitalization(.never)
            
            if let error = loginState.emailError {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            SecureField("Password", text: $loginState.password)
            
            if let error = loginState.passwordError {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button {
                if loginState.isValid() {
                    
                }
            } label: {
                Text("Login")
            } //.disabled(!loginState.isValid())

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
