//
//  MoviesListViewController.swift
//  Lecture18
//
//  Created by Lizi Chichua on 17.12.25.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var movieApiManager: MovieAPIManagerProtocol?
    private var upcomingMovies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        fetchMovies()
    }
    
    private func setUpTableView() {
        tableView.layer.backgroundColor = UIColor.black.cgColor
        tableView.dataSource = self
        
        tableView.register(
            UINib(nibName: "UpcomingTableViewCell", bundle: nil),
            forCellReuseIdentifier: "UpcomingTableViewCell"
        )
    }

    private func fetchMovies() {
        movieApiManager = MovieAPIManager()
        
        movieApiManager?.fetchMovies(with: .upcoming) { result in
            switch result {
            case .success(let movieResponse):
                self.upcomingMovies = movieResponse.movies
                print(movieResponse.movies)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingTableViewCell", for: indexPath) as! UpcomingTableViewCell
            cell.movies = upcomingMovies
            return cell
        }
        return UITableViewCell()
    }
}
