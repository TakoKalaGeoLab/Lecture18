//
//  UpcomingCollectionViewCell.swift
//  Lecture18
//
//  Created by Lizi Chichua on 17.12.25.
//

import UIKit
import Kingfisher

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var votesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.backgroundColor = UIColor.black.cgColor
    }
    
    func configure(with movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w300\(movie.posterImage)")
        coverImageView.kf.indicatorType = .activity
        coverImageView.kf.setImage(with: url)
        votesLabel.text = "\(movie.votes)⭐️"
    }

}
