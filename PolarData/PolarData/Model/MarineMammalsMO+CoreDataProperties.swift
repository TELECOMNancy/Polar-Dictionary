//
//  MarineMammalsMO+CoreDataProperties.swift
//  PolarData
//
//  Created by Anissa Bokhamy on 14/05/2018.
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
