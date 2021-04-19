//
//  ErrorHandler.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 18/04/21.
//

import SwiftUI

class ErrorHandler {
    
    static let shared = ErrorHandler()
    
    func consoleLogError(_ error: NSError) {
        print("Unresolved error \(error), \(error.userInfo)")
    }
    
    func alertErrorMessage(_ error: NSError) {
        // implement alert
    }
    
}
