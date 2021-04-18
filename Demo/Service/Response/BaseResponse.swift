//
//  BaseResponse.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

class BaseResponse: Codable {
    var success: Bool = false
    var message: String = ""
    
    init(success: Bool, message: String) {
        self.success = success
        self.message = message
    }
}
