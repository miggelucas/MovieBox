//
//  SellAllTableViewCell.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import UIKit

class SellAllTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "seeAllTableViewCell"

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(title : String, date : String, rating : Float, image : UIImage) {
        titleLabel.text = title
        dateLabel.text = "\(date.prefix(4))"
        ratingLabel.text = "\(rating)/10"
        posterImageView.image = image
    }
    
    
    
}



