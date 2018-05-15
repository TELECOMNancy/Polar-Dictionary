//
//  LocationMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension LocationMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationMO> {
        return NSFetchRequest<LocationMO>(entityName: "Location")
    }

    @NSManaged public var region: String?
    @NSManaged public var country: String?
    @NSManaged public var flora: NSSet?
    @NSManaged public var type: LocationTypeMO?
    @NSManaged public var pictures: NSSet?

}

// MARK: Generated accessors for flora
extension LocationMO {

    @objc(addFloraObject:)
    @NSManaged public func addToFlora(_ value: FloraMO)

    @objc(removeFloraObject:)
    @NSManaged public func removeFromFlora(_ value: FloraMO)

    @objc(addFlora:)
    @NSManaged public func addToFlora(_ values: NSSet)

    @objc(removeFlora:)
    @NSManaged public func removeFromFlora(_ values: NSSet)

}

// MARK: Generated accessors for pictures
extension LocationMO {

    @objc(addPicturesObject:)
    @NSManaged public func addToPictures(_ value: PictureMO)

    @objc(removePicturesObject:)
    @NSManaged public func removeFromPictures(_ value: PictureMO)

    @objc(addPictures:)
    @NSManaged public func addToPictures(_ values: NSSet)

    @objc(removePictures:)
    @NSManaged public func removeFromPictures(_ values: NSSet)

}
