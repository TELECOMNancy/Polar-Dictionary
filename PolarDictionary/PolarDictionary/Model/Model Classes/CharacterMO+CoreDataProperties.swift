//
//  CharacterMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension CharacterMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterMO> {
        return NSFetchRequest<CharacterMO>(entityName: "Character")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var nationality: String?
    @NSManaged public var birthDate: NSDate?
    @NSManaged public var deathDate: NSDate?

}
