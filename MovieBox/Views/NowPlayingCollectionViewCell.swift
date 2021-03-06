//
//  NowPlayingCollectionViewCell.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(title : String, image : UIImage, date : String) {
        titleLabel.text = title
        dateLabel.text = "\(date.prefix(4))"
        imageView.image = image
    }
}
