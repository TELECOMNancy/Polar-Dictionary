//
//  RegionSelectionTableViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class RegionSelectionTableViewController : UITableViewController{

    //MARK - Properties
    var regionList = ["Alaska","Canada"]
    /* var regionList = [LocationMO](){
        didSet {
            updateView()
        }}
    var fetchedResultsController: NSFetchedResultsController!
    
    //MARK - Functions for Core Data
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<LocationMO> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<LocationMO> = LocationMO.fetchRequest()
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self as? NSFetchedResultsControllerDelegate
        
        return fetchedResultsController
    }()
    
    
    
    
    func initializeFetchedResultsController() {
        let request = NSFetchRequest(entityName: "Person")
        let departmentSort = NSSortDescriptor(key: "department.name", ascending: true)
        let lastNameSort = NSSortDescriptor(key: "lastName", ascending: true)
        request.sortDescriptors = [departmentSort, lastNameSort]
        
        let moc = coreDataManager.managedObjectContext
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    //MARK - Functions for displaying data
    private func updateView() {
        let hasData = regionList.count > 0
        tableView.isHidden = !hasData
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*initializeFetchedResultsController()
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")
                
            } else {
                self.updateView()
                
                do {
                    try self.fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
                
                self.updateView()
            }
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //guard let regionList = fetchedResultsController.fetchedObjects else { return 0 }
        return regionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RegionSelectionTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RegionSelectionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RegionSelectionTableViewCell.")
        }
        
        // Fetch Quote
        //let region = fetchedResultsController.object(at: indexPath)
        
        let region = regionList[indexPath.row]
        cell.regionName.text = region
        return cell
    }
}
