//
//  PictureMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 14/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension PictureMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureMO> {
        return NSFetchRequest<PictureMO>(entityName: "Picture")
    }

    @NSManaged public var data: NSData?
    @NSManaged public var location: LocationMO?
    @NSManaged public var naturalPhenomenon: NaturalPhenomenonMO?

}
