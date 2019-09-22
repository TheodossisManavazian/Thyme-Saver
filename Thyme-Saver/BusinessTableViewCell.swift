//
//  BusinessTableViewCell.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/27/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var PicImageView: UIImageView!
    
    @IBOutlet weak var RateImageView: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var AddressLabel: UILabel!
    
    @IBOutlet weak var TagLabel: UILabel!
    
    @IBOutlet weak var DistanceLabel: UILabel!
    
    @IBOutlet weak var ReviewsCountLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    var business: Business! {
        didSet {
            NameLabel.text = business.name
            PicImageView.setImageWith(business.imageURL!)
            AddressLabel.text = business.address
            TagLabel.text = business.categories
            ReviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            RateImageView.setImageWith(business.ratingImageURL!)
            DistanceLabel.text = business.distance
        }
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
