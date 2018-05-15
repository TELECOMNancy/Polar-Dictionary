//
//  FloraMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension FloraMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FloraMO> {
        return NSFetchRequest<FloraMO>(entityName: "Flora")
    }

    @NSManaged public var nbPetals: Int32
    @NSManaged public var nbStamens: Int32
    @NSManaged public var petalColors: NSSet?
    @NSManaged public var floraType: FloraTypeMO?
    @NSManaged public var leavesShape: LeavesShapeMO?
    @NSManaged public var height: FlowerHeightMO?
    @NSManaged public var location: NSSet?

}

// MARK: Generated accessors for petalColors
extension FloraMO {

    @objc(addPetalColorsObject:)
    @NSManaged public func addToPetalColors(_ value: ColorEnumMO)

    @objc(removePetalColorsObject:)
    @NSManaged public func removeFromPetalColors(_ value: ColorEnumMO)

    @objc(addPetalColors:)
    @NSManaged public func addToPetalColors(_ values: NSSet)

    @objc(removePetalColors:)
    @NSManaged public func removeFromPetalColors(_ values: NSSet)

}

// MARK: Generated accessors for location
extension FloraMO {

    @objc(addLocationObject:)
    @NSManaged public func addToLocation(_ value: LocationMO)

    @objc(removeLocationObject:)
    @NSManaged public func removeFromLocation(_ value: LocationMO)

    @objc(addLocation:)
    @NSManaged public func addToLocation(_ values: NSSet)

    @objc(removeLocation:)
    @NSManaged public func removeFromLocation(_ values: NSSet)

}
