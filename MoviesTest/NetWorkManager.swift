//
//  NetWorkManager.swift
//  MoviesTest
//
//  Created by  Anita on 7/16/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation
import Alamofire

struct MTCustomResponce {
    let success : Bool
    let message : String
    
    public init(success: Bool, messages: String?){
        self.success = success
        self.message = messages!
    }
}



class NetWorkManager {
    
    static let sharedInstance = NetWorkManager()
    
    let apiKey = "524d1da15dd6397914216014187532db"
    
    // Get List
    
    func getFilmsList() {

        
}

    
}
