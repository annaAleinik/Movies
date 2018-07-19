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
    
    var modelFilm: FilmsProtocol?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup() 
    }

    func setup () {
        
        self.getTrailer()
        self.languageLable.text = modelFilm?.originalLanguage
        self.releaseDateLabel.text = modelFilm?.releaseDate
        let rating = modelFilm?.popularity ?? 0.0
        self.popularityLabel.text = String(describing: rating)
        self.descriptionTextView.text = modelFilm?.overview
        self.navigationItem.title = modelFilm?.originalTitle
        self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 128/255, green: 92/255, blue: 232/255, alpha: 1)

        let posterPath = modelFilm?.posterPath
        guard let poster = posterPath else {return}
        let link = APIConst.phosterURL + poster
        self.posterImg.downloadedFrom(link: link)
    }
    
    func getTrailer() {
        guard let id = modelFilm?.id else {return}
        let filmId = String(id)
        NetWorkManager.sharedInstance.getTrailer(filmId: filmId) { [weak self] (film, error) in
            guard let `self` = self else { return }
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let idTrailer = film?.first?.key else {return}
            self.videoPlayer.loadVideoID(idTrailer)
        }
    }

}
