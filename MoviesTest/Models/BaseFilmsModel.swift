//
//  BaseFilmsModel.swift
//  MoviesTest
//
//  Created by  Anita on 7/17/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation
import RealmSwift

class BaseFilmsModel: Object{
    var popularity: Double = 0.0
    
    
    @objc dynamic var originalTitle = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var posterPath = ""
    @objc dynamic var originalLanguage = ""
    @objc dynamic var overview = ""
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "originalTitle"
    }
}
