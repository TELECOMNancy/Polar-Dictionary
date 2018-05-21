//
//  SelecteurSurEntité.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class SelecteurSurEntité: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var Elements = [String]()
    var ElementsRaw = [NSManagedObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initData(Entité: getEntité())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initData(Entité: getEntité())
    }
    
    func initData(Entité: String) {
        //1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.coreDataManager.managedObjectContext
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Entité)
        
        //3
        do {
            ElementsRaw = try managedContext.fetch(fetchRequest)
            //print("\(elts.count) Elements trouvés :")
            Elements = initElements()
            for elt in ElementsRaw {
                Elements.append(entitéToString(entité: elt))
            }
            //print("\(Elements.count) éléments trouvés pour \(getEntité()) :")
            //print("\(Elements)")
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        self.delegate = self
        self.dataSource = self
    }
    
    func getEntité()->String {
        return ""
    }
    
    func entitéToString(entité : NSManagedObject)->String {
        return ""
    }
    
    func initElements()->[String] {
        return [String]()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Elements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Elements[row]
    }

}
