//
//  APIConstants.swift
//  MoviesTest
//
//  Created by  Anita on 7/16/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation


enum APIConst {
    static let baseURL = "https://api.themoviedb.org"
    static let listURL = "/4/list/1?page=1&api_key=524d1da15dd6397914216014187532db"
    static let phosterURL = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/"
    static let searchMovBaseURL = "https://api.themoviedb.org/3/search/movie?api_key=524d1da15dd6397914216014187532db&language=en-US&query="
    static let searchMovFinishURL = "&page=1&include_adult=false"
   static let trailerBaseURL = "https://api.themoviedb.org/3/movie/"
   static let trailerFinishURL =  "/videos?api_key=524d1da15dd6397914216014187532db&language=en-US"
}
