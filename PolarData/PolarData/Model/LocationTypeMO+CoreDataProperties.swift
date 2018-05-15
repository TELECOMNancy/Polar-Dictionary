//
//  LocationTypeMO+CoreDataProperties.swift
//  PolarData
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension LocationTypeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationTypeMO> {
        return NSFetchRequest<LocationTypeMO>(entityName: "LocationType")
    }

    @NSManaged public var location: NSSet?

}

// MARK: Generated accessors for location
extension LocationTypeMO {

    @objc(addLocationObject:)
    @NSManaged public func addToLocation(_ value: LocationMO)

    @objc(removeLocationObject:)
    @NSManaged public func removeFromLocation(_ value: LocationMO)

    @objc(addLocation:)
    @NSManaged public func addToLocation(_ values: NSSet)

    @objc(removeLocation:)
    @NSManaged public func removeFromLocation(_ values: NSSet)

}
