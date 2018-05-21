//
//  ElementTableViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class ElementTableViewController: UITableViewController {

    var elementList = [String]()
    var elementsList = [FloraMO]()
    //var dataController = 
    
    private let persistentContainer = NSPersistentContainer(name: "Model")
    var fetchedResultsController: NSFetchedResultsController<FloraMO>!
    
    func initializeFetchedResultsController() {
        let request = NSFetchRequest<FloraMO>(entityName: "Flora")
        request.returnsObjectsAsFaults = false
        let nameSort = NSSortDescriptor(key: "nbPetals", ascending: true)
        request.sortDescriptors = [nameSort]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let moc = appDelegate.coreDataManager.managedObjectContext
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self as? NSFetchedResultsControllerDelegate
        
        do {
            try fetchedResultsController.performFetch()
            //recuperer données ici
            
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    // MARK: -
    
    /*fileprivate lazy var fetchedResultsController: NSFetchedResultsController<ElementMO> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<ElementMO> = ElementMO.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self as! NSFetchedResultsControllerDelegate
        
        return fetchedResultsController
    }()*/
    
    //MARK - Function for Core Data
    
    /*func initializeFetchedResultsController() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Flora")
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        
        let moc = coreDataManager.managedObjectContext
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self as! NSFetchedResultsControllerDelegate
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }*/
    
    
    //MARK - Functions for data loading
    override func viewDidLoad() {
        super.viewDidLoad()
        try self.initializeFetchedResultsController()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: -
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sections = self.fetchedResultsController?.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LandFaunaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LandFaunaTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ElementTableViewCell.")
        }

        guard let object = self.fetchedResultsController?.object(at: indexPath) else {
            fatalError("Attempt to configure cell without a managed object")
        }
        let toto = self.fetchedResultsController?.fetchedObjects
        // Fetches the appropriate meal for the data source layout.
        //let element = elementsList[indexPath.row]
        //print(object.floraType)
        //print(object.value(forKey: "frenchName"))
        //print(object.name)
        cell.nameLabel?.text = object.value(forKey: "frenchName") as! String
        cell.latinLabel?.text = object.value(forKey: "latinName") as! String
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "ShowLandFaunaDetails":
            guard let landFaunaDetailViewController = segue.destination as? LandFaunaViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedElementCell = sender as? LandFaunaTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedElementCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            landFaunaDetailViewController.data = self.fetchedResultsController.object(at: indexPath) as! FloraMO
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

}
