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
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
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
    
    fileprivate func makePopularCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            
            let movie = popularMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       // nesse momento é possível colocar uma image de placeholder
                       // enquanto o backdrop é baixado
                       image: UIImage()
            )
            
            Task{
                let imageData = await TmdpAPI.donwloadImageData(withPath: movie.backdropPath)
                let image = UIImage(data: imageData)
                cell.setup(title: movie.title,
                           image: image ?? UIImage())
            }
           
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            
            let movie = nowPlayingMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       image: UIImage(named: movie.posterPath) ?? UIImage(),
                       date: movie.releaseDate)
            
            Task {
                let imageData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData)

                cell.setup(title: movie.title,
                           image: image ?? UIImage(),
                           date: movie.releaseDate)
                
            }
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            
            let movie = upcomingMovies[indexPath.item]
            
            cell.setup(title: movie.title,
                       image: UIImage(named: movie.posterPath) ?? UIImage(),
                       date: movie.releaseDate)
            Task {
                let imageData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData)

                cell.setup(title: movie.title,
                           image: image ?? UIImage(),
                           date: movie.releaseDate)
                
            }
            
            
            return cell
        }
        return UpcomingCollectionViewCell()
    }
    
}
