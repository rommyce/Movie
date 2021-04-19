//
//  AdaptsToSoftwareKeyboard.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI
import Combine

/**
 This is a modifier that move textfield up when keyboard has appeared.

 - parameter currentHeight: Current height of keyboard that start in 0
 
 # Example #
 ```
 var body: some View {
    VStack()
         .modifier(AdaptsToSoftwareKeyboard())
 }
 ```
 */
struct AdaptsToSoftwareKeyboard: ViewModifier {
    
    @State var currentHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
          .padding(.bottom, currentHeight)
          .edgesIgnoringSafeArea(.bottom)
          .onAppear(perform: subscribeToKeyboardEvents)
          .animation(.spring())
    }

    private func subscribeToKeyboardEvents() {
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
              name: UIResponder.keyboardWillShowNotification
        ).compactMap { notification in
                notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        }.map { rect in
              rect.height
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))

        NotificationCenter.Publisher(
              center: NotificationCenter.default,
              name: UIResponder.keyboardWillHideNotification
        ).compactMap { notification in
              CGFloat.zero
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
    }
}
