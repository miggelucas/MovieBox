//
//  ViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 05/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var trendingTodayMovies : [Movie] = []
    var trendingThisWeekMovies : [Movie] = []
    
    // recebe o seu valor com base no segmented selecionado
    var trendingMovies : [Movie] = []
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var trendingTableView: UITableView!
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            trendingMovies = trendingTodayMovies
            trendingTableView.reloadData()
        } else {
            trendingMovies = trendingThisWeekMovies
            trendingTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trendingTableView.dataSource = self
        self.trendingTableView.delegate = self
        // Do any additional setup after loading the view.
        
        Task {
            trendingTodayMovies = await Movie.trendingTodayAPI()
            trendingThisWeekMovies = await Movie.trendingThisWeekAPI()
            trendingMovies = trendingTodayMovies
            trendingTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}

extension TrendingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as? TrendingTableViewCell {
            
            let movie = trendingMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       date: movie.releaseDate,
                       image: UIImage()
            )
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData)
                
                cell.setup(title: movie.title,
                           date: movie.releaseDate,
                           image: image ?? UIImage())
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension TrendingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // mudar com base em qual segmeted esta selecionado
        let movie = trendingMovies[indexPath.item]
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
