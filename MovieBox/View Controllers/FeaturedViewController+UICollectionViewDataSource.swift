//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return Movie.popularMovies().count
            } else if collectionView == nowPlayingCollectionView {
                return Movie.nowPlayingMovies().count
            } else if collectionView == upcomingCollectionView {
                return Movie.upcomingMovies().count
            } else {
                return 0
            }
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == popularCollectionView {
            return makePopularCell(collectionView, indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(collectionView, indexPath)
        } else if collectionView == upcomingCollectionView {
            return makeUpcomingCell(collectionView, indexPath)
        }
        
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            
            let popularMovies = Movie.popularMovies()
            let movie = popularMovies[indexPath.item]
            
            cell.titleLabel.text = movie.title
            cell.image.image = UIImage(named: movie.backdrop)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell {
            
            let nowPLayingMovies = Movie.nowPlayingMovies()
            let movie = nowPLayingMovies[indexPath.item]
            
            cell.titleLabel.text = movie.title
            cell.dateLabel.text = movie.releaseDate
            cell.imageView.image = UIImage(named: movie.poster)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell {
            
            let upcomingMovies = Movie.upcomingMovies()
            let movie = upcomingMovies[indexPath.item]
            
            cell.titleLabel.text = movie.title
            cell.dateLabel.text = movie.releaseDate
            cell.imageView.image = UIImage(named: movie.poster)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
}
