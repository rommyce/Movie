//
//  CustomError.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

enum CustomError: Error {
    case invalidData
}

// For each error type return the appropriate description
extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidData:
            return "Su usuario y/o password son incorrectos."
        }
    }
}

// For each error type return the appropriate localized description
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString(
                "Su usuario y/o password son incorrectos.",
                comment: "Login invalido"
            )
        }
    }
}


