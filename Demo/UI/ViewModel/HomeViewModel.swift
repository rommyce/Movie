//
//  HomeViewModel.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var showErrorAlert: Bool = false
    @Published var error: Error?{
        didSet{
            showErrorAlert = error != nil
        }
    }
    
    func listMoview(inPage page: Int) {
        let service = MovieService()
        service.listMovie(page: page) { (response) in
            if page == 1 {
                self.movies = response.results
            } else {
                self.movies.append(contentsOf: response.results)
            }
            
        } failure: { (error) in
            self.error = error
        }
    }
    
}
