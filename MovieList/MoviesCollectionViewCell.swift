//
//  MoviesCollectionViewCell.swift
//  MovieList
//
//  Created by Manikandan on 6/4/21.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var ratingMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
