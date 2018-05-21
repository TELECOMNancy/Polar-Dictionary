//
//  AppDelegate.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreDataManager: CoreDataManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        coreDataManager = CoreDataManager(modelName: "Model")
        print(coreDataManager.managedObjectContext)
        //affichage de là ouù est stocké le sqlite
        let moc = coreDataManager.managedObjectContext
        let coordinator = moc.persistentStoreCoordinator
        let stored = coordinator?.persistentStores
        for store in stored!{
            print(store.url!)
        }
        preloadData()
        
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PolarDictionary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: Private functions
    
    
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }
        
        return managedObjectModel
    }()
    
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let fileManager = FileManager.default
        let storeName = "\("Model").sqlite"
        
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                              configurationName: nil,
                                                              at: persistentStoreURL,
                                                              options: nil)
        } catch {
            fatalError("Unable to Load Persistent Store")
        }
        
        return persistentStoreCoordinator
    }()
    
    func parseCSV (contentsOfURL: URL, encoding: inout String.Encoding, error: NSErrorPointer) -> [(frenchName:String, englishName:String, latinName: String, type: String, family:String, length:String, nbPetals:String, petalColors: String, nbSepals: String, nbStamens: String, stamens: String, fruit:String, stem: String, leaves: String, description: String, webLink:String, country:String)]? {
        let delimiter = ";"
        var lineNumber = 0
        var items:[(frenchName:String, englishName:String, latinName: String, type: String, family:String, length:String, nbPetals:String, petalColors: String, nbSepals: String, nbStamens: String, stamens: String, fruit:String, stem: String, leaves: String, description: String, webLink:String, country:String)]?
        do{
            let content = try String(contentsOf: contentsOfURL, usedEncoding: &encoding)
            items = []
            let lines:[String] = content.components(separatedBy: NSCharacterSet.newlines as CharacterSet) as [String]
            
            for line in lines {
                var values:[String] = []
                //print(line)
                if (line != "" && lineNumber>2){
                    //print("lineNumber = " + String(lineNumber))
                    // For a line with double quotes
                    // we use NSScanner to perform the parsing
                    if line.range(of: "\"") != nil {
                        var textToScan:String = line
                        var value:NSString?
                        var textScanner:Scanner = Scanner(string: textToScan)
                        while textScanner.string != "" {
                            
                            if (textScanner.string as NSString).substring(to: 1) == "\"" {
                                textScanner.scanLocation += 1
                                textScanner.scanUpTo("\"", into: &value)
                                textScanner.scanLocation += 1
                            } else {
                                textScanner.scanUpTo(delimiter, into: &value)
                            }
                            
                            // Store the value into the values array
                            values.append(value! as String)
                            
                            // Retrieve the unscanned remainder of the string
                            if textScanner.scanLocation < textScanner.string.count {
                                textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                            } else {
                                textToScan = ""
                            }
                            textScanner = Scanner(string: textToScan)
                        }
                        
                        // For a line without double quotes, we can simply separate the string
                        // by using the delimiter (e.g. comma)
                        } else  {
                            values = line.components(separatedBy:delimiter)
                        }
                        // Put the values into the tuple and add it to the items array
                        let item = (frenchName: values[0], englishName: values[1], latinName: values[2], type: values[3], family: values[4], length: values[5], nbPetals: values[7], petalColors: values[8], nbSepals: values[9], nbStamens: values[10], stamens: values[11], fruit: values[12], stem: values[13], leaves: values[14], description: values[15], webLink: values[16],country: values[17])
                        items?.append(item)
                    }
                lineNumber = lineNumber + 1
            }
        }
        catch{
            print(error)}
        
        return items
    }
    
    func preloadData () {
        let managedObjectContext = self.managedObjectContext
        //Add data to enumerations
        preloadFloraTypes()
        
        // Retrieve data from the source file for Flora
        if let contentsOfURL = Bundle.main.url(forResource: "Plantes", withExtension: "csv") {
            
            // Remove all the menu items before preloading
            removeDataFromFlora()
            
            var error:NSError?
            var encoding = String.Encoding.utf8
            if let items = parseCSV(contentsOfURL: contentsOfURL, encoding: &encoding, error: &error) {
                // Preload the menu items
                let managedObjectContext = self.managedObjectContext
                
                for item in items {
                    let floraItem = NSEntityDescription.insertNewObject(forEntityName: "Flora", into: managedObjectContext) as! FloraMO
                    floraItem.frenchName = item.frenchName
                    floraItem.englishName = item.englishName
                    floraItem.latinName = item.latinName
                    if(item.type != ""){
                        floraItem.floraType = findFloraType(floraType: item.type)
                    }
                    floraItem.family = item.family
                    //floraItem.length = item.length
                    //floraItem.nbPetals = item.nbPetals
                    //floraItem.s
                    //floraItem.latinName = (item.price as NSString).doubleValue
                    
                    do {
                        try managedObjectContext.save()
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                }
            }
        }
    }
    
    func removeDataFromFlora () {
        // Remove the existing items
        let managedObjectContext = self.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flora")
        let menuItems = try? managedObjectContext.fetch(fetchRequest) as! [FloraMO]
        for menuItem in menuItems! {
            managedObjectContext.delete(menuItem)
        }
    }
    
    
    func removeDataFromFloraType() {
        // Remove the existing items
        let managedObjectContext = self.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FloraType")
        let menuItems = try? managedObjectContext.fetch(fetchRequest) as! [FloraTypeMO]
        for menuItem in menuItems! {
            managedObjectContext.delete(menuItem)
        }
    }
    
    
    func preloadFloraTypes(){
        let managedObjectContext = self.managedObjectContext
        //Add data to enumerations
        removeDataFromFloraType()
        let floraTypes = ["plante","arbre","arbuste","ligneux","mousse","lichens","graminé"]
        for type in floraTypes{
            let typeItem = NSEntityDescription.insertNewObject(forEntityName: "FloraType", into: managedObjectContext) as! FloraTypeMO
            typeItem.name = type
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    func findFloraType(floraType : String) -> FloraTypeMO {
        let managedObjectContext = self.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FloraType")
        fetchRequest.predicate = NSPredicate(format:"ANY name LIKE[c] %@",floraType)
        let floraTypes = try? managedObjectContext.fetch(fetchRequest) as! [FloraTypeMO]
        assert((floraTypes?.count)! == 1)
        return floraTypes![0]
    }


}

