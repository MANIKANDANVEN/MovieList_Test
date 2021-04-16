//
//  ViewController.swift
//  MovieList
//
//  Created by Manikandan on 6/4/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var movieTitle: [String] = []
    var countData = 0
    var imageHrefLink: [String] = []
    var ratingList: [Double] = []
    var releaseDateList: [String] = []
    var imageDownloaded: [UIImage] = []
    var selectedMovieTitle: String!
    var selectedRating: String!
    var selectedReleaseDate: String!
    var selectedImage: UIImage!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getDataFromJSON();
        
        // Collection View Source Initailize
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieListCell");
        
        // Button round edges
        refreshButton.layer.cornerRadius = 15
        refreshButton.addTarget(self, action: #selector(refreshButtonAction), for: .touchUpInside)
        
       
    }
        
    // Getting data from JSON File
    func getDataFromJSON(){
        let url = Bundle.main.url(forResource: "movies", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let JSON = try! JSONSerialization.jsonObject(with: data, options: [])
    
    
        if let jsonArray = JSON as? [String: Any] {
                        

                // Getting Movie Titles From JSON Script
                let movies = jsonArray["movies"] as? [[String: Any]]
                    for anItem in movies! as [Dictionary<String, AnyObject>] {
                        let title = anItem["title"] as? String
                
                        movieTitle.append(title!)
                }
            
                // Getting Image URL From JSON Script
                let imageHref = jsonArray["movies"] as? [[String: Any]]
                    for anItem in imageHref! as [Dictionary<String, AnyObject>] {
                            let Link = anItem["imageHref"] as? String ?? "https://banner2.cleanpng.com/20180402/gdw/kisspng-null-pointer-symbol-computer-icons-pi-5ac1c0964f62d5.3135633215226471903252.jpg"
                        
                        imageHrefLink.append(Link)
       
                }
            
                // Getting Image From URL
                for items in imageHrefLink{
                
                    let url = URL(string: items)!
  
                    if let data = try? Data(contentsOf: url) {
                            DispatchQueue.main.async() { [weak self] in
                                self!.imageDownloaded.append(UIImage(data: data)!)
                            }
                            
                    }

                }
            
                // Getting Movie Titles From JSON Script
                let rating = jsonArray["movies"] as? [[String: Any]]
                    for anItem in rating! as [Dictionary<String, AnyObject>] {
                        let ratingData = anItem["rating"] as? Double ?? 0.0
            
                        ratingList.append(ratingData)
                    }
            
                // Getting Movie Titles From JSON Script
                let releaseDate = jsonArray["movies"] as? [[String: Any]]
                    for anItem in releaseDate! as [Dictionary<String, AnyObject>] {
                        let releaseDataList = anItem["releaseDate"] as? String
        
                        releaseDateList.append(releaseDataList!)
                    }
        
        }
        countData = movieTitle.count
        
    }

    // Collection View number of items in the selection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countData;
        }
    
    
    // Collection View Cell's Layout
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth = collectionView.frame.size.width
        return CGSize(width: cellWidth, height: cellWidth*0.8)
        }
    
    // Collection View function for selecting
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        selectedMovieTitle = movieTitle[indexPath.row]
        selectedRating = String(format: "%.1f",ratingList[indexPath.row])
        selectedReleaseDate = releaseDateList[indexPath.row]
        selectedImage = imageDownloaded[indexPath.row]
        
        print (selectedMovieTitle!)
        print (selectedRating!)
        print (selectedReleaseDate!)
        
        
        self.performSegue(withIdentifier: "movieDetailsSegue", sender: self)
        
        
    }
    
    // Collection View function for allocating data to the indexpath.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListCell", for: indexPath) as! MoviesCollectionViewCell;

            cell.movieTitle.text = movieTitle[indexPath.row]
            cell.ratingMovie.text = String(format: "%.1f",ratingList[indexPath.row])
            cell.releaseDate.text = releaseDateList[indexPath.row]
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {

                cell.movieImage.image = self.imageDownloaded[indexPath.row]
            
            }
    
            return cell;
        }
    
    
    // Async Image download function
    //func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
       // URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    //}
    
    
    
    @objc func refreshButtonAction(sender: UIButton!) {
        collectionView.reloadData()
    }
    
    
    
    // Segue function to pass data to another viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailsViewController
        {
            destination.selectedMovieTitle = selectedMovieTitle!
            destination.selectedRating = selectedRating!
            destination.selectedReleaseDate = selectedReleaseDate!
            destination.selectedImage = selectedImage!
        }
        
    }
        

}


