//
//  Movie.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

struct Movie : Hashable, Codable, Identifiable {
    
    var id: Int = 0
    var poster_path: String = ""
    var title: String = ""
    var vote_average: Double? = 0.0
    var release_date: String = ""
    var overview: String = ""
    
    init(id: Int, poster_path: String, title: String, vote_average: Double, release_date: String, overview: String){
        self.id = id
        self.poster_path = poster_path
        self.title = title
        self.vote_average = vote_average
        self.release_date = release_date
        self.overview = overview
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case poster_path = "poster_path"
        case title = "title"
        case vote_average = "vote_average"
        case release_date = "release_date"
        case overview = "overview"
    }
    
    var imageURL: URL? {
        let imageURLString = "https://image.tmdb.org/t/p/w500/\(poster_path)"
        return URL(string: imageURLString)
    }
    
    init(dummy:Bool? = nil){
        guard let isDummy = dummy else { return }
        if isDummy {
            poster_path = "erw"
            title = "Doraemon"
            vote_average = 1.0
            release_date = "09/11/2020"
            overview = "eer"
        }
    }
    
    static func convert(from local: MovieStore) -> Movie? {
        let id = Int(local.id)
        let vote_average = local.vote_average 
        let poster_path = local.poster_path ?? ""
        let title = local.title ?? ""
        let release_date = local.release_date ?? ""
        let overview = local.overview ?? ""

        return Movie(id: id, poster_path: poster_path, title: title, vote_average: vote_average, release_date: release_date, overview: overview)
    }
    
    func convertToManagedObject() -> MovieStore {
        let movie: MovieStore = CoreDataManager.shared.initManagedObject()
        movie.id = Int32(self.id)
        movie.poster_path = poster_path
        movie.title = title
        movie.vote_average = vote_average ?? 0.0
        movie.release_date = release_date
        movie.overview = overview
        return movie
    }
}
