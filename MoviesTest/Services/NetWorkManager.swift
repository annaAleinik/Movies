//
//  NetWorkManager.swift
//  MoviesTest
//
//  Created by  Anita on 7/16/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import Foundation
import Alamofire

class NetWorkManager {
    
    static let sharedInstance = NetWorkManager()
    
    let apiKey = "524d1da15dd6397914216014187532db"
    let dataStore = DataStore()
    
    
    // Get List
    
    func getFilmsList(completion : @escaping (Array<ResultsModel>?, Error?) -> Void) {
        let url = APIConst.baseURL + APIConst.listURL
        
        Alamofire.request(url, method: HTTPMethod.get , parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(_ ):
                do {
                    let films = try JSONDecoder().decode(FilmsModel.self, from: response.data!)
                    
                    for film in films.results {
                        let filmBase = BaseFilmsModel()
                        filmBase.id = film.id
                        filmBase.originalLanguage = film.originalLanguage
                        filmBase.originalTitle = film.originalTitle
                        filmBase.overview = film.overview
                        filmBase.posterPath = film.posterPath
                        filmBase.releaseDate = film.releaseDate
                        self.dataStore.addData(object: filmBase)
                    }

                    completion(films.results, nil)
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(nil, error)

            }
        }
    }
    
    // get trailer
    
    func getTrailer(filmId: String, completion : @escaping(Array<ResultsTrailerModel>? , Error?) -> Void) {
        let url = APIConst.trailerBaseURL + filmId + APIConst.trailerFinishURL

        Alamofire.request(url, method: HTTPMethod.get , parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(_ ):
                do {
                    let data = try JSONDecoder().decode(FilmsTrailerModel.self, from: response.data!)
                    completion(data.results, nil)
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(nil, error)
                
            }
        }
        
    }
    
    
    //search movies
    
    func searchMovies(searchText: String, completion : @escaping(Array<ResultsModel>? , Error?) -> Void) {
        let url = APIConst.searchMovBaseURL + searchText + APIConst.searchMovFinishURL
        
        Alamofire.request(url, method: HTTPMethod.get , parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(_ ):
                do {
                    let films = try JSONDecoder().decode(FilmsModel.self, from: response.data!)
                    
                    for film in films.results {
                        let filmBase = BaseFilmsModel()
                        filmBase.id = film.id
                        filmBase.originalLanguage = film.originalLanguage
                        filmBase.originalTitle = film.originalTitle
                        filmBase.overview = film.overview
                        filmBase.posterPath = film.posterPath
                        filmBase.releaseDate = film.releaseDate
                        self.dataStore.addData(object: filmBase)
                    }
                    
                    completion(films.results, nil)
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                print(error)
                completion(nil, error)
                
            }
        }
        
    }

    
}
