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

    // MARK: - Method
    func listMoview(inPage page: Int) {
        let service = MovieService()
        service.listMovie(page: page) { (response) in
            ///For first page stored movies will removed and the new movies are inserted to coredata
            if page == 1 {
                self.movies = response.results
                MovieDAO.shared.saveAll(isFirstPage: true, movies: response.results)
            ///For other pages movies are append to coredata
            } else {
                self.movies.append(contentsOf: response.results)
                MovieDAO.shared.saveAll(isFirstPage: false, movies: response.results)
            }
        } failure: { (error) in
            ///If fail conexion to API, return list stored in coredata
            self.movies = MovieDAO.shared.getAll(in: true)
        }
    }
    
}