//
//  SearchTableViewCell.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let cellIdentifier = "searchTableViewCell"
    
    
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func setup(title : String, date : String, image : UIImage) {
        titleLabel.text = title
        dateLabel.text = "\(date.prefix(4))"
        posterImage.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
