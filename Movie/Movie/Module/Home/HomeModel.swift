//
//  HomeModel.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import Foundation

struct HomeModel {
    
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    struct Response: Codable {
        var page: Int
        var total_pages: Int
        var results: [Movie]
    }
}


struct Movie: Codable, Hashable {
    var id: Int
    var poster_path: String?
    var backdrop_path: String?
    var title: String?
    var release_date: String?
    var vote_average: Float?
    var overview: String?
}
