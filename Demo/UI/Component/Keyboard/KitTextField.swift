//
//  KitTextField.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import SwiftUI

/**
 This is a textfield with configured resignResponder. On click return key the
 focus of  textfield change to next tagged textfield

 - parameter label: Label.
 - parameter text: Binding text.
 - parameter focusable: State of focusable.
 - parameter isSecureTextEntry: If is security input.
 - parameter returnKeyType: Type of return key.
 - parameter autocapitalizationType: State of autocapitalization.
 - parameter keyboardType: Keyboard type.
 - parameter textContentType: Text content type.
 - parameter tag: Tag.
 - parameter inputAccessoryView: Accesory view for appearance.
 - parameter onCommit: The action to perform when the user performs an action
 
 # Notes: #
 1. Parameter isSecureTextEntry also can input security text
 
 # Example #
 ```
 KitTextField (
                 label: "\(label)",
                 text: $username,
                 focusable: $fieldFocus,
                 returnKeyType: .next,
                 tag: 0
 )
 ```
 */
struct KitTextField: UIViewRepresentable {
    let label: String
    @Binding var text: String
    
    var focusable: Binding<[Bool]>? = nil
    var isSecureTextEntry: Binding<Bool>? = nil
    
    var returnKeyType: UIReturnKeyType = .default
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType? = nil
    
    var tag: Int? = nil
    var inputAccessoryView: UIToolbar? = nil
    
    var onCommit: (() -> Void)? = nil
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.placeholder = label
        
        textField.returnKeyType = returnKeyType
        textField.autocapitalizationType = autocapitalizationType
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry?.wrappedValue ?? false
        textField.textContentType = textContentType
        textField.textAlignment = .left
        
        if let tag = tag {
            textField.tag = tag
        }
        
        textField.inputAccessoryView = inputAccessoryView
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
        
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = isSecureTextEntry?.wrappedValue ?? false
        
        if let focusable = focusable?.wrappedValue {
            var resignResponder = true
            
            for (index, focused) in focusable.enumerated() {
                if uiView.tag == index && focused {
                    uiView.becomeFirstResponder()
                    resignResponder = false
                    break
                }
            }
            
            if resignResponder {
                uiView.resignFirstResponder()
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        let control: KitTextField
        
        init(_ control: KitTextField) {
            self.control = control
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            guard var focusable = control.focusable?.wrappedValue else { return }
            
            for i in 0...(focusable.count - 1) {
                focusable[i] = (textField.tag == i)
            }
            
            control.focusable?.wrappedValue = focusable
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            guard var focusable = control.focusable?.wrappedValue else {
                textField.resignFirstResponder()
                return true
            }
            
            for i in 0...(focusable.count - 1) {
                focusable[i] = (textField.tag + 1 == i)
            }
            
            control.focusable?.wrappedValue = focusable
            
            if textField.tag == focusable.count - 1 {
                textField.resignFirstResponder()
            }
            
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            control.onCommit?()
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            control.text = textField.text ?? ""
        }
    }
}
