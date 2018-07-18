//
//  InfoFilmVC.swift
//  MoviesTest
//
//  Created by  Anita on 7/17/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import UIKit
import YouTubePlayer

class InfoFilmVC: UIViewController {
  
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var languageLable: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet var videoPlayer: YouTubePlayerView!
    
    var modelFilm: ResultsModel?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.languageLable.text = modelFilm?.originalLanguage
        self.releaseDateLabel.text = modelFilm?.releaseDate
        self.popularityLabel.text = String(describing: modelFilm?.popularity)
        self.descriptionTextView.text = modelFilm?.overview
        
        let posterPath = modelFilm?.posterPath
        guard let poster = posterPath else {return}
        let link = APIConst.phosterURL + poster
        self.posterImg.downloadedFrom(link: link)
        
        guard let id = modelFilm?.id else {return}
        let filmId = String(id)
        
        NetWorkManager.sharedInstance.getTrailer(filmId: filmId) { (film, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let idTrailer = film?.first?.key else {return}
            self.videoPlayer.loadVideoID(idTrailer)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = modelFilm?.originalTitle

       
    }

    

}
