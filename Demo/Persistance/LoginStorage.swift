//
//  LoginStorage.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 19/04/21.
//

import Foundation

class LoginStorage {
    
    static let shared = LoginStorage()

    /**
     This function save user in userdefault.
     
     - parameter user: User name.
     - parameter password: Password of user.
     
     # Example #
     ```
     LoginStorage.shared.save(user: user, password: password)
     ```
     */
    func save(user: String, password: String){
        do{
            let user = User(user: user, password: password)
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.setValue(userData, forKey: "USER_APP")
        } catch (let error){
            print(error)
        }
    }
    
    /**
     This function get user in userdefault.

     - returns User: stored user data.
     
     # Example #
     ```
     LoginStorage.shared.get()
     ```
     */
    func get() -> User?{
        do{
            guard let userData = UserDefaults.standard.data(forKey: "USER_APP") else {
                return nil
            }
            let user = try JSONDecoder().decode(User.self, from: userData)
            return user
        } catch (let error){
            print(error)
            return nil
        }
    }
}

