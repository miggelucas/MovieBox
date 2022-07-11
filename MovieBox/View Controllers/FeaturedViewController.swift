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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
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

//MARK: - UICollecitonView DataSource

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = "Título do Filme"
        cell?.image.image = UIImage()
        
        
        // return minha optinal custom cell
        // se der pau, recebe uma collectionsViewCell vazia
        return cell ?? UICollectionViewCell()
    }
    
    
    
}

extension FeaturedViewController: UICollectionViewDelegate {
    
    
}
