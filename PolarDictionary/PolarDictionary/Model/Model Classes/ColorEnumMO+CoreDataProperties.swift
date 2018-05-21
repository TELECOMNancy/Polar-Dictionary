//
//  ColorEnumMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension ColorEnumMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ColorEnumMO> {
        return NSFetchRequest<ColorEnumMO>(entityName: "ColorEnum")
    }

    @NSManaged public var beakColor: NSSet?
    @NSManaged public var birdColor: NSSet?
    @NSManaged public var legColor: NSSet?
    @NSManaged public var petalColors: NSSet?

}

// MARK: Generated accessors for beakColor
extension ColorEnumMO {

    @objc(addBeakColorObject:)
    @NSManaged public func addToBeakColor(_ value: BirdMO)

    @objc(removeBeakColorObject:)
    @NSManaged public func removeFromBeakColor(_ value: BirdMO)

    @objc(addBeakColor:)
    @NSManaged public func addToBeakColor(_ values: NSSet)

    @objc(removeBeakColor:)
    @NSManaged public func removeFromBeakColor(_ values: NSSet)

}

// MARK: Generated accessors for birdColor
extension ColorEnumMO {

    @objc(addBirdColorObject:)
    @NSManaged public func addToBirdColor(_ value: BirdMO)

    @objc(removeBirdColorObject:)
    @NSManaged public func removeFromBirdColor(_ value: BirdMO)

    @objc(addBirdColor:)
    @NSManaged public func addToBirdColor(_ values: NSSet)

    @objc(removeBirdColor:)
    @NSManaged public func removeFromBirdColor(_ values: NSSet)

}

// MARK: Generated accessors for legColor
extension ColorEnumMO {

    @objc(addLegColorObject:)
    @NSManaged public func addToLegColor(_ value: BirdMO)

    @objc(removeLegColorObject:)
    @NSManaged public func removeFromLegColor(_ value: BirdMO)

    @objc(addLegColor:)
    @NSManaged public func addToLegColor(_ values: NSSet)

    @objc(removeLegColor:)
    @NSManaged public func removeFromLegColor(_ values: NSSet)

}

// MARK: Generated accessors for petalColors
extension ColorEnumMO {

    @objc(addPetalColorsObject:)
    @NSManaged public func addToPetalColors(_ value: FloraMO)

    @objc(removePetalColorsObject:)
    @NSManaged public func removeFromPetalColors(_ value: FloraMO)

    @objc(addPetalColors:)
    @NSManaged public func addToPetalColors(_ values: NSSet)

    @objc(removePetalColors:)
    @NSManaged public func removeFromPetalColors(_ values: NSSet)

}
