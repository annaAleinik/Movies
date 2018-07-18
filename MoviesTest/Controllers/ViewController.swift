//
//  ViewController.swift
//  MoviesTest
//
//  Created by  Anita on 7/16/18.
//  Copyright © 2018  Anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var arrFilms = [ResultsModel]()
    let dataStore = DataStore()
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
       
        if Reachability.isConnectedToNetwork(){
            self.getDataFromServer()
        }else{
            //self.getFataFromDB()
        }
        
//        self.filteredData = self.arrFilms.compactMap{$0.originalTitle}
        
        self.navigationItem.title = "Films"
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
    
    func getDataFromServer(){
        NetWorkManager.sharedInstance.getFilmsList { (film, error) in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            if let array = film {
                self.arrFilms = array
                self.tableView.reloadData()
            }
        }
    }

    
//    func getFataFromDB(){
//       let arr = self.dataStore.getAllFilmsFromDB()
//        self.arrFilms = arr
//    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredData = self.arrFilms.compactMap{$0.originalTitle}
        filteredData = searchText.isEmpty ? filteredData : filteredData.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }

}
