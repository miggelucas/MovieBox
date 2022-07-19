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
    
    var popularMovies : [Movie]  = []
    var nowPlayingMovies : [Movie] = []
    var upcomingMovies : [Movie] = []
    
    
    
    @IBAction func seeAllPopular(_ sender: UIButton) {
        let movieList = popularMovies
        performSegue(withIdentifier: "seeAllSegue", sender: movieList)
        
    }
    
    @IBAction func seeAllNowPlaying(_ sender: UIButton) {
        let movieList = nowPlayingMovies
        performSegue(withIdentifier: "seeAllSegue", sender: movieList)
    }
    
    @IBAction func seeAllUpcoming(_ sender: UIButton) {
        let movieList = upcomingMovies
        performSegue(withIdentifier: "seeAllSegue", sender: movieList)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleep(2)
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self

        
        
        Task {
            self.popularMovies = await TmdpAPI.getPopularMovies()
            self.nowPlayingMovies = await TmdpAPI.getNowPlayingMovies()
            self.upcomingMovies = await TmdpAPI.getUpcomingMovies()
            
            self.popularCollectionView.reloadData()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingCollectionView.reloadData()
        }
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let destination = segue.destination as? DetailsViewController {
                let movie = sender as? Movie
                destination.movie = movie
            }
        } else if segue.identifier == "seeAllSegue" {
            if let destination = segue.destination as? SeeAllViewController {
                
                // eu posso dar force unwrap nesse caso?
                let movieList = sender as! [Movie]
                destination.movieList = movieList
                
            }
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

    



