//
//  BusinessesViewController.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/27/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating{
    
    
    @IBOutlet weak var BusinessTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var businesses: [Business]!
    var filteredData: [Business]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BusinessTableView.dataSource = self
        BusinessTableView.delegate = self
        BusinessTableView.rowHeight = UITableViewAutomaticDimension
        BusinessTableView.estimatedRowHeight = 90
        
        Business.searchWithTerm(term: sharedCuisineValue, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.BusinessTableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
            }
        )
        
        
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        BusinessTableView.tableHeaderView = searchController.searchBar
        

    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredData.count
        }
        else {
            if businesses != nil {
                return businesses.count
            }
            else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BusinessTableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessTableViewCell
        
//        cell.business = businesses[indexPath.row]
        
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.business = filteredData[indexPath.row]
        }
        else {
            cell.business = businesses[indexPath.row]
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search Restaurants"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = UIColor.red
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filteredData = searchText.isEmpty ? businesses : businesses.filter({ (business) -> Bool in
                if let name = business.name {
                    return name.range(of: searchText, options: .caseInsensitive) != nil
                }
                return false
            })
            BusinessTableView.reloadData()
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  cell = sender as! UITableViewCell
        if let indexPath = BusinessTableView.indexPath(for: cell) {
            let restaurant = businesses[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.business = restaurant
        }
        
    }
    @IBAction func backk(_ sender: Any) {
        
       let dash : ProfileVC = storyboard!.instantiateViewController(withIdentifier: "goToProfilePage") as! ProfileVC
       self.navigationController?.pushViewController(dash, animated: true)
    }
    

    
}



