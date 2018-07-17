//
//  FilmModel.swift
//  MoviesTest
//
//  Created by  Anita on 7/16/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation

struct FilmsModel : Codable {
    var results: [ResultsModel]
}

struct ResultsModel : Codable {
    let  id: Int
   let video: Bool
   let media_type: String
  let  title: String
 let   popularity: Float
  let  poster_path: String
 let   original_language: String
 let   original_title: String
  let  genre_ids: [Int]
 let   backdrop_path: String
 let   adult: Bool
  let  overview: String
  let  release_date: String

}
