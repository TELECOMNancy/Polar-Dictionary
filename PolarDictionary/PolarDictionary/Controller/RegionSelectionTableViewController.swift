//
//  RegionSelectionTableViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation
import UIKit
class RegionSelectionTableViewController : UITableViewController{
    
    var regionList = ["Alaska","Canada"] //[String]()
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RegionSelectionTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RegionSelectionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RegionSelectionTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let region = regionList[indexPath.row]
        
        cell.regionName.text = region
        return cell
    }
}
