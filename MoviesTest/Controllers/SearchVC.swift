//
//  SearchVC.swift
//  MoviesTest
//
//  Created by  Anita on 7/18/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var arrFilms = [ResultsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
        self.navigationItem.title = "Search"

    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let film = self.arrFilms[(indexPath.row)]
        cell.filmTitle.text = film.originalTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = self.arrFilms[indexPath.row]
        let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoFilmVC") as! InfoFilmVC
        self.navigationController?.pushViewController(infoVC, animated: true)
        infoVC.modelFilm = film
    }
    
    @IBAction func searchTap(_ sender: UIButton) {
        NetWorkManager.sharedInstance.searchMovies(searchText: self.textField.text!) { (films, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            if let array = films {
                self.arrFilms = array
                self.tableView.reloadData()
            }
        }
    }
    
}
