//
//  Movie.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

struct Movie : Identifiable{
    
    var id: Int = 0
    var poster_path: String = ""
    var title: String = ""
    var vote_average: String = ""
    var release_date: String = ""
    var overview: String = ""
    
    init(dummy:Bool? = nil){
        guard let isDummy = dummy else { return }
        if isDummy {
            poster_path = "erw"
            title = "Doraemon"
            vote_average = "5"
            release_date = "09/11/2020"
            overview = "eer"
        }
    }
}
