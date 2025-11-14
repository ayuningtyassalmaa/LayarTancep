//
//  APIServices.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/9/25.
//

import Foundation
import Alamofire


class APIServices {
    
    let APIKey = "6976bb0c00c68df6f8a38205c94e9ab7"
    
    // Popular Movies list
    func popularMovieslist(completion: @escaping ([PopularMoviesDataResults]?) -> Void) {
        
        let query : [String: Any] =
                    ["api_key" : APIKey,
                    "language": "en-US",
                     "page": "1",
                     "region": "US"]
        let endpoint = endpoints.getEndpoints(.popularListMovies)
        
        AF.request(endpoint, method: .get, parameters: query)
            .validate()
            .responseDecodable(of: PopularMovies.self) {
                response in
                
                print("endpoint..\(endpoint)")
                
                switch response.result {
                case .success(let data):
                    completion(data.results ?? [])
                case .failure(let error):
                    print("err")
                }
            }
    }
}
