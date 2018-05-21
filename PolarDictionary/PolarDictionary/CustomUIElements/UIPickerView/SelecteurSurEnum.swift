//
//  SelecteurSurEnum.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class SelecteurSurEnum : SelecteurSurEntité {

    override func entitéToString(entité: NSManagedObject) -> String {
        let nom = entité.value(forKey: "name") as? String
        return nom!
    }
    
}
