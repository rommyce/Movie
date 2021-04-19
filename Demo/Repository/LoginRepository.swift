//
//  LoginRepository.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 19/04/21.
//

final class LoginRepository {

    private let loginService: LoginService = LoginService()
    private var cache: LoginStorage = LoginStorage.shared

}

extension LoginRepository {

    typealias ReturnLoginClosure = (Bool) -> Void
    
    public func fetchLogin(user: String,
                           password: String,
                           success: @escaping ReturnLoginClosure,
                           failure: @escaping ErrorClosure){

        /// Creation of login request
        let login = LoginRequest(user: user, password: password)
        print(login)
        loginService.login(user: user, password: password) { (response) in
            if(response.success){
                //store user in userdefaults
                self.cache.save(user: user, password: password)
                success(true)
            }else{
                failure(CustomError.invalidData)
            }
        } failure: { (error) in
            failure(error)
        }
    }
}
