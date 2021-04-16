//
//  MovieDetailsViewController.swift
//  MovieList
//
//  Created by Manikandan on 7/4/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    

    var selectedMovieTitle: String!
    var selectedRating: String!
    var selectedReleaseDate: String!
    var selectedImage: UIImage!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        movieTitle.text = selectedMovieTitle ?? "None"
        movieRating.text = selectedRating ?? "None"
        movieReleaseDate.text = selectedReleaseDate ?? "None"
        movieImage.image = selectedImage ?? UIImage(named:"DownArrowColor.png")
        
        movieImage.layer.cornerRadius = 15
        
        
    }
    
    
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
