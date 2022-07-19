//
//  TrendingTableViewCell.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 18/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let cellIdentifier = "trendingTableCell"
    
    @IBOutlet var posterImage: UIImageView!
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
