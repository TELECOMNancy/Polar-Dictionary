//
//  FloraTypeMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension FloraTypeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FloraTypeMO> {
        return NSFetchRequest<FloraTypeMO>(entityName: "FloraType")
    }

    @NSManaged public var floraType: NSSet?

}

// MARK: Generated accessors for floraType
extension FloraTypeMO {

    @objc(addFloraTypeObject:)
    @NSManaged public func addToFloraType(_ value: FloraMO)

    @objc(removeFloraTypeObject:)
    @NSManaged public func removeFromFloraType(_ value: FloraMO)

    @objc(addFloraType:)
    @NSManaged public func addToFloraType(_ values: NSSet)

    @objc(removeFloraType:)
    @NSManaged public func removeFromFloraType(_ values: NSSet)

}
