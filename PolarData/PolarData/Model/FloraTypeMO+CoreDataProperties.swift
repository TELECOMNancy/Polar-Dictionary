//
//  FloraTypeMO+CoreDataProperties.swift
//  PolarData
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension FloraTypeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FloraTypeMO> {
        return NSFetchRequest<FloraTypeMO>(entityName: "FloraType")
    }

    @NSManaged public var flora: NSSet?

}

// MARK: Generated accessors for flora
extension FloraTypeMO {

    @objc(addFloraObject:)
    @NSManaged public func addToFlora(_ value: FloraMO)

    @objc(removeFloraObject:)
    @NSManaged public func removeFromFlora(_ value: FloraMO)

    @objc(addFlora:)
    @NSManaged public func addToFlora(_ values: NSSet)

    @objc(removeFlora:)
    @NSManaged public func removeFromFlora(_ values: NSSet)

}
