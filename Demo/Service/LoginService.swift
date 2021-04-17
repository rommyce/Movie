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

struct Login: Encodable {
    let user: String
    let password: String
}

struct LoginService {
    
    let mainURL = "www.api-ga.kambista.com/"
    
    func login(user: String,
               password: String,
               success: @escaping ReturnUserClosure,
               failure: @escaping ErrorClosure){
        
        let url = "\(mainURL)login"
        let login = Login(user: user, password: password)
        let request = AF.request(url, method: .post, parameters: login,
                                 encoder: JSONParameterEncoder.default).response { response in
                          debugPrint(response)
                      }
        
        request.validate().responseDecodable(of: LoginResponse.self) { response in
            switch response.result{
            case .failure(let error):
                print(error)
                failure(error)
            case .success(let dto):
                success(dto)
            }
        }
    }
}
