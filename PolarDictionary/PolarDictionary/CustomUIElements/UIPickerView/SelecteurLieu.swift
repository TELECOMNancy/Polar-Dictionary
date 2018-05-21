//
//  SelecteurLieu.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class SelecteurLieu: SelecteurOptionnelSurEntité {

    override func getEntité() -> String {
        return "Location"
    }
    
    override func entitéToString(entité: NSManagedObject) -> String {
        let country = entité.value(forKey: "country") as? String
        let region = entité.value(forKey: "region") as? String
        return "\(region!), \(country!)"
    }

}
