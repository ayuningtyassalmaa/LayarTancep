//
//  PopularMovies.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/9/25.
//

import Foundation

struct PopularMovies: Codable {
    let page: Int?
    let results: [PopularMoviesDataResults]?
    let total_pages: Int?
    let total_results: Int?
}

struct PopularMoviesDataResults: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}

