//
//  LoginButtonStyle.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

/**
 This is a style create for login button.

 - parameter startColor: Leftside color.
 - parameter endColor: Rightside color.
 - parameter colorScheme: Scheme mode configured in device.
 - parameter isDisabled: State of button.
 
 # Notes: #
 1. Parameters colorScheme nos mandatory if tha app will not have dark mode
 2. Parameters isDisabled nos mandatory if tha button will not disable
 
 # Example #
 ```
 @Environment(\.colorScheme) var colorScheme
 
 var body: some View {
     Button()
         .buttonStyle(LoginButtonStyle(startColor: Color.yellow,
         endColor: Color.orange, colorScheme: colorScheme,
         isDisabled: isDisabled))
 }
 ```
 */
struct LoginButtonStyle: ButtonStyle {
    
    var startColor: Color
    var endColor: Color
    var colorScheme: ColorScheme = .light
    
    @State var isDisabled : Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(configuration.isPressed ? .gray : colorScheme == .dark ? .black : .white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(CGFloat(RADIUS_STAND))
            .font(Font.body.bold())
            .disabled(isDisabled)
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .opacity(configuration.isPressed ? 0.5 : isDisabled ? 0.5 : 1)
    }
}
