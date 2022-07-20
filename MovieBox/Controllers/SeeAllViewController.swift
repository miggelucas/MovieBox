//
//  SeeAllViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import UIKit

class SeeAllViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var movieList : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
}


extension SeeAllViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SellAllTableViewCell.cellIdentifier, for: indexPath) as? SellAllTableViewCell {
            
            let movie = movieList[indexPath.item]
            
            cell.setup(title: movie.title,
                       date: movie.releaseDate,
                       rating: movie.voteAverage,
                       image: UIImage())
            
            Task {
                let imageData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title,
                           date: movie.releaseDate,
                           rating: movie.voteAverage,
                           image: image)
                
            }
            return cell
            
        }
        return UITableViewCell()
    }
    
    
}


extension SeeAllViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieList[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
        print(movie)
        // desmarca a seleção após a escolha da cell
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    
    
}
