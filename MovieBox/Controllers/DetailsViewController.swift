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

    
    @IBAction func posterImageButtonPressed(_ sender: UIButton) {
        print("poster image button foi pressed")
        performSegue(withIdentifier: "posterImageSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PosterImageViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        guard let movie = movie else {
            return
        }
        

        titleLabel.text = movie.title

        posterImage.image = UIImage(named: movie.posterPath)
        backdropImage.image = UIImage(named: movie.backdropPath)
        ratingLabel.text = "rating: \(movie.voteAverage)/10"
        genresLabel.text = String()
        
        durationLabel.text = String()
        descriptionLabel.text = movie.overview
        
        // get poster and backdrop Image
        Task {
            let posterData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath)
            let backdropData = await TmdpAPI.donwloadImageData(withPath: movie.backdropPath)
            posterImage.image = UIImage(data: posterData) ?? UIImage()
            backdropImage.image = UIImage(data : backdropData) ?? UIImage()
            
        }
        
        
        // get genres and runtime for Movie
        Task {
            let movieDetails = await TmdpAPI.getDetails(id: movie.id)
            print(movieDetails)
            let time = movieDetails.formatedRuntime()
            
            let genresString = movieDetails.genres.map { genres in
                return genres.name
            }
            
            var genreList : [String] = []
            for genre in movieDetails.genres {
                genreList.append(genre.name)
            }
            print(genreList)
//
//            var aux = ""
//            for i in 0...genresString.count - 1 {
//                if i == genresString.count - 1 {
//                    aux += genresString[i]
//                } else {
//                    aux += genresString[i] + ", "
//                }
//            }
            
            genresLabel.text = formatGenres(list: genreList)
            durationLabel.text = time
            
        }
        // Do any additional setup after loading the view.
    }
    
    func formatGenres(list : [String]) -> String {
        var stringGenres : String = ""
        for kind in list {
            stringGenres = "\(stringGenres) \(kind)"
        }
        return stringGenres
    }

    
    
}
