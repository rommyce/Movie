//
//  HomeRepository.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 18/04/21.
//

import Foundation

final class HomeRepository {

    private let movieService: MovieService = MovieService()
    private var cache: MovieStorage = MovieStorage.shared

}

extension HomeRepository {

    public func fetchMoviesList(page: Int,
                                completion: @escaping ([Movie]) -> Void){

        movieService.listMovie(page: page) { [self] (response) in
            ///For first page stored movies will removed and the new movies are inserted to coredata
            if page == 1 {
                cache.saveAll(isFirstPage: true, movies: response.results)
            ///For other pages movies are append to coredata
            } else {
                cache.saveAll(isFirstPage: false, movies: response.results)
            }
            completion(response.results)
        } failure: { (error) in
            ///If fail conexion to API, return list stored in coredata
            let movies = self.cache.getAll(in: true)
            completion(movies)
        }
    }
}
