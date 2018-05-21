//
//  EnumerationMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension EnumerationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EnumerationMO> {
        return NSFetchRequest<EnumerationMO>(entityName: "Enumeration")
    }

    @NSManaged public var name: String?

}
