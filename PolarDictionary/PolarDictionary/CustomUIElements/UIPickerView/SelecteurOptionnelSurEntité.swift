//
//  SelecteurOptionnelSurEntité.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class SelecteurOptionnelSurEntité: SelecteurSurEntité {

    override func initElements()->[String] {
        return ["(rien)"]
    }
    
    func getSelectedRawElement()->NSManagedObject? {
        if self.selectedRow(inComponent: 0) == 0 {
            return nil
        } else {
            return self.ElementsRaw[self.selectedRow(inComponent: 0)-initElements().count]
        }
    }

}
