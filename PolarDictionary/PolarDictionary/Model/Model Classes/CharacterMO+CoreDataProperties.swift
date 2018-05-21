//
//  CharacterMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension CharacterMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterMO> {
        return NSFetchRequest<CharacterMO>(entityName: "Character")
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var deathDate: NSDate?
    @NSManaged public var firstName: String?
    @NSManaged public var nationality: String?

}
