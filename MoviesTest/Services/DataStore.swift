//
//  DataStore.swift
//  MoviesTest
//
//  Created by  Anita on 7/17/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import RealmSwift

class DataStore {
    
    private var database = try! Realm()
    private let filmModel = BaseFilmsModel()

    
    func getObjFromBase() -> BaseFilmsModel {
        let film = database.objects(BaseFilmsModel.self)
        return film.first!
    }
    
    func addData(object: Object)   {
        try! database.write {
            database.add(object, update: true)
        }
    }
    
    func getAllFilmsFromDB() -> Array<BaseFilmsModel>{
        let arrFilmsFromDB = database.objects(BaseFilmsModel.self)
        return Array(arrFilmsFromDB)
    }
    
}

