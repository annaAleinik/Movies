//
//  FilmsProtocol.swift
//  MoviesTest
//
//  Created by  Anita on 7/19/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation

protocol FilmsProtocol {
    var popularity: Double { get set }
    var posterPath: String { get set }
    var originalLanguage: String { get set }
    var originalTitle: String { get set }
    var overview: String { get set }
    var releaseDate: String { get set }
    var id: Int { get set }

}
