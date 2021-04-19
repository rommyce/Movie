//
//  HomeViewModel.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    // MARK: - Declare
    @Published var movies: [Movie] = []
    @Published var showErrorAlert: Bool = false
    @Published var error: Error?{
        didSet{
            showErrorAlert = error != nil
        }
    }
    var page: Int = 1
    
    // MARK: - Method
    func listMoview() {
        let repository = HomeRepository()
        repository.fetchMoviesList(page: page) { [self] (response) in
            ///For first page replace result in movies
            if self.page == 1 {
                self.movies = response
            ///For other pages movies are append to list
            } else {
                self.movies.append(contentsOf: response)
            }
            self.page += 1
        }
    }
}
