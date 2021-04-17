//
//  LoginViewModel.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var success: Bool = false
    @Published var messsage: String = ""
    @Published var showErrorAlert: Bool = false
    @Published var error: Error?{
        didSet{
            showErrorAlert = error != nil
        }
    }
    
    func login(user: String, password: String){
        let service = LoginService()
        service.login(user: user, password: password) { (userDTO) in
            self.showErrorAlert = false
            self.success = userDTO.success
            self.messsage = userDTO.message
        } failure: { (error) in
            self.messsage = error.localizedDescription
            self.showErrorAlert = true
        }
    }
}
