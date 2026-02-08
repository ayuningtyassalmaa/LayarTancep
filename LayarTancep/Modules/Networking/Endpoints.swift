//
//  Endpoints.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/9/25.
//

import Foundation

class endpoints {
    static func getEndpoints (_ keys: endpointsAPI ) -> String {
        return keys.rawValue
    }
    
    enum endpointsAPI: String {
        case popularListMovies = "https://api.themoviedb.org/3/movie/popular"
        case nowPlayingMovies = "https://api.themoviedb.org/3/movie/now_playing"
    }
}
