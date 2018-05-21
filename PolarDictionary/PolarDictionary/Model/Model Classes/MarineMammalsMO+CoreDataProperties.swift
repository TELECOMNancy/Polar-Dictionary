//
//  MarineMammalsMO+CoreDataProperties.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
//

import Foundation
import CoreData


extension MarineMammalsMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MarineMammalsMO> {
        return NSFetchRequest<MarineMammalsMO>(entityName: "MarineMammals")
    }


}
