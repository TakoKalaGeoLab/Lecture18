//
//  MoviesListViewController.swift
//  Lecture18
//
//  Created by Lizi Chichua on 17.12.25.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    private var movieApiManager: MovieAPIManagerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovies()
    }

    private func fetchMovies() {
        movieApiManager = MovieAPIManager()
        
        movieApiManager?.fetchMovies(with: .upcoming) { result in
            switch result {
            case .success(let movieResponse):
                print(movieResponse.movies)
            case .failure(let error):
                print(error)
            }
        }
    }

}
