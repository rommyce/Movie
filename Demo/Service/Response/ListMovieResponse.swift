//
//  ListMovieResponse.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation

struct ListMovieResponse: Codable {
    var page: Int = 0
    var results: [Movie] = []
    var total_pages: Int = 0
    var total_results: Int = 0
}
