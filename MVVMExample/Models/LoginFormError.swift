//
//  LoginFormError.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 20/04/2023.
//

import Foundation

struct LoginFormError {
    var email: String = ""
    var password: String = ""
}

enum LoginError: Error, LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
        case .emailEmpty:
            return "Email is required!"
        case .emailInvalid:
            return "Email is in the wrong format!"
        case .passwordEmpty:
            return "Password is required!"
        }
    }
}
