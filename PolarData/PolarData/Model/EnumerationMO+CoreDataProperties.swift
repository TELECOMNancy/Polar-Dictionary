//
//  EnumerationMO+CoreDataProperties.swift
//  PolarData
//
//  Created by Anissa Bokhamy on 14/05/2018.
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
