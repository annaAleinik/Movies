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

        let url = "https://api.themoviedb.org/4/list/1?page=1&api_key=524d1da15dd6397914216014187532db"
        
        Alamofire.request(url, method: HTTPMethod.get , parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(_ ):
                do {
                    let films = try JSONDecoder().decode(FilmsModel.self, from: response.data!)
                    print(films)
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
        
}

    
}
