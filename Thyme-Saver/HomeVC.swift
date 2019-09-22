//
//  HomeVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 2/25/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import MapKit
import CoreLocation

class HomeVC: UIViewController {


    
    var myString = String()
    
    // reference to Database and Database handler
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // sets reference

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
