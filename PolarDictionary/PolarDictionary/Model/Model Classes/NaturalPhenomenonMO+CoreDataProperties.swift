//
//  NaturalPhenomenonMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension NaturalPhenomenonMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NaturalPhenomenonMO> {
        return NSFetchRequest<NaturalPhenomenonMO>(entityName: "NaturalPhenomenon")
    }

    @NSManaged public var picture: NSSet?

}

// MARK: Generated accessors for picture
extension NaturalPhenomenonMO {

    @objc(addPictureObject:)
    @NSManaged public func addToPicture(_ value: PictureMO)

    @objc(removePictureObject:)
    @NSManaged public func removeFromPicture(_ value: PictureMO)

    @objc(addPicture:)
    @NSManaged public func addToPicture(_ values: NSSet)

    @objc(removePicture:)
    @NSManaged public func removeFromPicture(_ values: NSSet)

}
