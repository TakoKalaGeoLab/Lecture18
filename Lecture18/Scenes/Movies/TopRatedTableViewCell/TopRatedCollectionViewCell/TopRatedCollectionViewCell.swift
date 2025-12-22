//
//  TopRatedCollectionViewCell.swift
//  Lecture18
//
//  Created by Lizi Chichua on 22.12.25.
//

import UIKit
import Kingfisher

class TopRatedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    func configure(with movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterImage)")
        coverImageView.kf.indicatorType = .activity
        coverImageView.kf.setImage(with: url)
    }
}
