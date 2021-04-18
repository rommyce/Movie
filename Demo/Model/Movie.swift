//
//  Movie.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

struct Movie : Identifiable, Codable{
    
    var id: Int = 0
    var poster_path: String = ""
    var title: String = ""
    var vote_average: Double = 0.0
    var release_date: String = ""
    var overview: String = ""
    
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
}
