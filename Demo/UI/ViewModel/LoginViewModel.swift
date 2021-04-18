//
//  LoginViewModel.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var loginResponse: LoginResponse = LoginResponse(success: false, message: "")
    @Published var messsage: String = ""
    @Published var showErrorAlert: Bool = false
    @Published var error: Error?{
        didSet{
            showErrorAlert = error != nil
        }
    }
    
    func login(user: String, password: String){
        let service = LoginService()
        service.login(user: user, password: password) { (response) in
            self.loginResponse = response
        } failure: { (error) in
            self.error = error
            self.messsage = error.localizedDescription
        }
    }
}
