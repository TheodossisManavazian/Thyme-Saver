//
//  SearchVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/4/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit


class SearchVC: UIViewController {
    @IBOutlet weak var termField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Search(_ sender: UIButton) {
        sharedCuisineValue = termField.text!
    }
    

}

