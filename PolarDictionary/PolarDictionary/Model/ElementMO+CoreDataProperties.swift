//
//  ElementMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension ElementMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementMO> {
        return NSFetchRequest<ElementMO>(entityName: "Element")
    }

    @NSManaged public var name: String?
    @NSManaged public var description_: String?
    @NSManaged public var webLink: String?

}
