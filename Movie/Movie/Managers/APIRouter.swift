//
//  APIRouter.swift
//  Movie
//
//  Created by ITUMAC03 on 18/07/24.
//

import Foundation
enum APIRouter {
    static let baseURL = "https://api.themoviedb.org/3/"
    case discover(page: Int, inclueAdult: Bool)
    case genres
    case videos(id: Int)
    case reviews(id: Int, page: Int)
    case similer(id: Int)
    case credits(id: Int)
    
    var path: String {
        switch self {
        case .discover:
            return "discover/movie"
        case .genres:
            return "genre/movie/list?language=en"
        case .videos(let id):
            return "movie/\(id)/videos?language=en"
        case .reviews(let id, _):
            return "movie/\(id)/reviews"
        case .similer(let id):
            return "movie/\(id)/similar?language=en-US&page=1"
        case .credits(let id):
            return "movie/\(id)/credits?language=en-US"
        }
    }
    
    var parameters: [String: Any?]? {
        switch self {
        case .discover(let page, let includeAdult):
            return [
                "page": page,
                "sort_by": "popularity.desc",
                "include_adult" : includeAdult
            ]
        case .reviews(_, let page):
            return [
                "page": page
            ]
        default: return nil
        }
    }
}
