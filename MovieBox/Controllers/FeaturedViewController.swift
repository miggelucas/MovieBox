//
//  FeaturedViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 07/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    var popularMovies : [Movie]  = []// Movie.popularMovies()
    var nowPlayingMovies : [Movie] = []
    var upcomingMovies : [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.nowPlayingMovies = await Movie.nowPlayingAPI()
            self.upcomingMovies = await Movie.upcomingAPI()
            
            self.popularCollectionView.reloadData()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingCollectionView.reloadData()
        }
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
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

    



