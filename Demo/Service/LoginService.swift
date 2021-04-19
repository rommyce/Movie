//
//  LoginService.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation
import Alamofire

typealias ReturnUserClosure = (LoginResponse) -> Void
typealias ErrorClosure = (Error) -> Void

struct LoginService {
    
    /// Service of login that allow to enter
    func login(user: String,
               password: String,
               success: @escaping ReturnUserClosure,
               failure: @escaping ErrorClosure){
        
        /// Creation of login request
        let login = LoginRequest(user: user, password: password)
        print(login)
        
        /// Simulation of login with user "Admin" and password "Password*123"
        if(user == "Admin" && password == "Password*123"){
            success(LoginResponse(success: true, message: "Bienvenido!"))
        }else{
            failure(CustomError.invalidData)
        }
    }
}

