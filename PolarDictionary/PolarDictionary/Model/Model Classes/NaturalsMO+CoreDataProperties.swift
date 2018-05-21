//
//  NaturalsMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension NaturalsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NaturalsMO> {
        return NSFetchRequest<NaturalsMO>(entityName: "Naturals")
    }

    @NSManaged public var englishName: String?
    @NSManaged public var family: String?
    @NSManaged public var frenchName: String?
    @NSManaged public var latinName: String?

}
