//
//  DetailsViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie : Movie?
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let movie = movie else {
            return
        }
        
        backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "rating: \(movie.voteAverage)/10"
        genresLabel.text = formatGenres(genresList: movie.genres)
        
        //durationlabel.text = stringGenres
        descriptionLabel.text = movie.overview
        print(movie)
        // Do any additional setup after loading the view.
    }
    
    func formatGenres(genresList : [String]) -> String {
        var stringGenres : String = ""
        for kind in genresList {
            stringGenres = "\(stringGenres) \(kind)"
        }
        return stringGenres
    }

}
