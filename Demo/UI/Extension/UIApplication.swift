//
//  UIApplication.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

extension UIApplication {
    
    /// End state of editing
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
