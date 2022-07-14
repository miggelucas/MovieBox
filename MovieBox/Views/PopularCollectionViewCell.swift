//
//  PopularCollectionViewCell.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(title : String, image : UIImage){
        titleLabel.text  = title
        imageView.image = image
    }
    
}
