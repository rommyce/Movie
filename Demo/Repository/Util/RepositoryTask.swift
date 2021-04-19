//
//  RepositoryTask.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 19/04/21.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: Cancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
