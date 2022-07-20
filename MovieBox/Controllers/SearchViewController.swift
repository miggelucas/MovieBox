//
//  SearchViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating  {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else {
                    return
                }
                Task {
                    self.movieList = await TmdpAPI.getSearchMovies(searchString: title)
                    searchTableView.reloadData()
                }
    }
    
    
    
    
    @IBOutlet weak var searchTextfield: UITextField!
    
    @IBAction func searchPressed(_ sender: UIButton) {
//
//        if let searchString = searchTextfield.text {
//
//            Task {
//                movieList = await TmdpAPI.getSearchMovies(searchString: searchString)
//                searchTableView.reloadData()
//
//            }
//        }
    }
    
    var movieList : [Movie] = []
    let searchController = UISearchController()
    
    @IBOutlet weak var searchTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { view.endEditing(true)
     }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
}

extension SearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.cellIdentifier, for: indexPath) as? SearchTableViewCell {
            
            let movie = movieList[indexPath.item]
            
            cell.setup(title: movie.title,
                       date: movie.releaseDate,
                       image: UIImage()
            )
            
            Task {
                let imageData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath ?? "")
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

extension SearchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieList[indexPath.item]
        performSegue(withIdentifier: "detailsSegue", sender: movie)
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
}
