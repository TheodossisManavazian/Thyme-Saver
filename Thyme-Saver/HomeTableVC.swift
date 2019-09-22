//
//  HomeTableVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 4/12/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import MapKit
import CoreLocation

class HomeTableVC: UIViewController {

    
    @IBOutlet weak var swipeImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var myString = String()
    
    // reference to Database and Database handler
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        var business: Business! {
            didSet {
                nameLabel.text = business.name
                swipeImageView.setImageWith(business.imageURL!)
                addressLabel.text = business.address
                tagLabel.text = business.categories
                reviewCountLabel.text = "\(business.reviewCount!) Reviews"
                rateImageView.setImageWith(business.ratingImageURL!)
                distanceLabel.text = business.distance
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
