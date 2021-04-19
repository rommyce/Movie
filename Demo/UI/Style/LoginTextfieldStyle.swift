//
//  LoginTextfieldStyle.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

/**
 This is a style create for login textfields.

 # Example #
 ```
 TextField()
     .textFieldStyle(LoginTextfieldStyle())
 ```
 */
struct LoginTextfieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(10)
                .cornerRadius(CGFloat(values.radius))
                .overlay(VStack{Divider().offset(x: 0, y: 15)})
    }
}
