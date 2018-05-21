//
//  FaunaMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension FaunaMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FaunaMO> {
        return NSFetchRequest<FaunaMO>(entityName: "Fauna")
    }

    @NSManaged public var femaleWeight: Float
    @NSManaged public var maleWeight: Float
    @NSManaged public var size: Float

}
