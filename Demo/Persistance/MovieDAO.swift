//
//  MovieDAO.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 18/04/21.
//

import SwiftUI

class MovieDAO {
    
    static let shared = MovieDAO()

    /**
     This function save the list of movies in coredata. Tha first page have to send isFirst = true to remove stored data and insert new data.
     
     - parameter isFirst: Status if is first page.
     - parameter movies: List of moview.
     
     # Notes: #
     1. Parameter isFirst must be false when page is not 1
     
     # Example #
     ```
     MovieDAO.shared.saveAll(first: true, movies: response.results)
     ```
     */
    func saveAll(isFirstPage isFirst:Bool, movies: [Movie]){
        if(isFirst){
            deleteAll()
        }
        for item in movies {
            _ = save(item)
        }
    }
   
    /**
     This function save the movie in coredata.
     
     - parameter movie: Entity movie to store.
     
     # Example #
     ```
     MovieDAO.shared.save(movie: movie)
     ```
     */
    func save(_ movie: Movie) -> Bool {
        _ = movie.convertToManagedObject()
        return CoreDataManager.shared.saveContext()
    }
    
    /**
     This function delete the movie in coredata.
     
     - parameter movie: Entity movie to delete.
     
     # Example #
     ```
     MovieDAO.shared.delete(movie: movie)
     ```
     */
    func delete(_ movie: Movie) -> Bool {
        guard let movie: MovieStore = CoreDataManager.shared.fetchObject(by: movie.id) else { return false }
        return CoreDataManager.shared.delete(movie)
    }
    
    /**
     This function delete all entry data of movie in coredata.
     
     # Example #
     ```
     MovieDAO.shared.deleteAll()
     ```
     */
    func deleteAll(){
        CoreDataManager.shared.deleteRecords(entityName: "MovieStore")
    }
    
    /**
     This function return the movie by id.
     
     - parameter id: Identifier of movie.
     
     # Example #
     ```
     MovieDAO.shared.delete(movie: movie)
     ```
     */
    func get(by id: Int) -> Movie? {
        guard let local: MovieStore = CoreDataManager.shared.fetchObject(by: id) else { return nil }
        let movie = Movie.convert(from: local)
        return movie
    }
    
    /**
     This function get the list of movies from coredata.
     
     - parameter alphabeticOrder: Status If need to return by alphabetical order .
     
     # Notes: #
     1. When parameter alphabeticOrder = true, list of movie will return with alphabetical order by title.
     
     # Example #
     ```
     MovieDAO.shared.getAll(alphabeticOrder: false)
     ```
     */
    func getAll(in alphabeticOrder: Bool = false) -> [Movie] {
        var sorters: [NSSortDescriptor]? = nil
        if alphabeticOrder {
            sorters = [ NSSortDescriptor(key: "title", ascending: true) ]
        }
        guard let locals: [MovieStore] = CoreDataManager.shared.fecth(sorting: sorters) else { return [] }
        let movies = locals.compactMap { (local) -> Movie? in Movie.convert(from: local) }
        return movies
    }
}

