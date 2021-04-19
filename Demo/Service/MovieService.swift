//
//  MovieService.swift
//  Demo
//
//  Created by Rommy Fuentes Davila Otani on 17/04/21.
//

import Foundation
import Alamofire

typealias ReturnListMovieClosure = (ListMovieResponse) -> Void

struct MovieService {
    
    /// Service of list of movie that allow to get 20 movies per page
    func listMovie(page: Int = 1,
                   success: @escaping ReturnListMovieClosure,
                   failure: @escaping ErrorClosure){

        /// Url create with page number and apikey
        let url = "\(ServiceConstant.mainUrl)movie/upcoming?page=\(page)&api_key=\(ServiceConstant.apiKEy)"
        
        /// Request for service
        let request = AF.request(url, method: .get)
        request.validate().responseDecodable(of: ListMovieResponse.self) { response in
            switch response.result{
                case .failure(let error):
                    print(error.localizedDescription)
                    failure(error)
                case .success(let response):
                    success(response)
            }
        }
    }
}

