//
//  BirdMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension BirdMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BirdMO> {
        return NSFetchRequest<BirdMO>(entityName: "Bird")
    }

    @NSManaged public var beakShape: String?
    @NSManaged public var legShape: String?
    @NSManaged public var length: Float
    @NSManaged public var shape: NSData?
    @NSManaged public var wingspan: Float
    @NSManaged public var beakColor: NSSet?
    @NSManaged public var birdColor: NSSet?
    @NSManaged public var legColor: ColorEnumMO?

}

// MARK: Generated accessors for beakColor
extension BirdMO {

    @objc(addBeakColorObject:)
    @NSManaged public func addToBeakColor(_ value: ColorEnumMO)

    @objc(removeBeakColorObject:)
    @NSManaged public func removeFromBeakColor(_ value: ColorEnumMO)

    @objc(addBeakColor:)
    @NSManaged public func addToBeakColor(_ values: NSSet)

    @objc(removeBeakColor:)
    @NSManaged public func removeFromBeakColor(_ values: NSSet)

}

// MARK: Generated accessors for birdColor
extension BirdMO {

    @objc(addBirdColorObject:)
    @NSManaged public func addToBirdColor(_ value: ColorEnumMO)

    @objc(removeBirdColorObject:)
    @NSManaged public func removeFromBirdColor(_ value: ColorEnumMO)

    @objc(addBirdColor:)
    @NSManaged public func addToBirdColor(_ values: NSSet)

    @objc(removeBirdColor:)
    @NSManaged public func removeFromBirdColor(_ values: NSSet)

}
