//
//  LandFaunaMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension LandFaunaMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LandFaunaMO> {
        return NSFetchRequest<LandFaunaMO>(entityName: "LandFauna")
    }


}
