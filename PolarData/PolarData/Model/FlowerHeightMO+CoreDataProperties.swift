//
//  FlowerHeightMO+CoreDataProperties.swift
//  PolarData
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension FlowerHeightMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlowerHeightMO> {
        return NSFetchRequest<FlowerHeightMO>(entityName: "FlowerHeight")
    }

    @NSManaged public var flora: NSSet?

}

// MARK: Generated accessors for flora
extension FlowerHeightMO {

    @objc(addFloraObject:)
    @NSManaged public func addToFlora(_ value: FloraMO)

    @objc(removeFloraObject:)
    @NSManaged public func removeFromFlora(_ value: FloraMO)

    @objc(addFlora:)
    @NSManaged public func addToFlora(_ values: NSSet)

    @objc(removeFlora:)
    @NSManaged public func removeFromFlora(_ values: NSSet)

}
