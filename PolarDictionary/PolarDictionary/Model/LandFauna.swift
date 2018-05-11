//
//  LandFauna.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation
class LandFauna : Fauna{
    override init(name: String, description: String, webLink: String, frenchLabel: String, englishLabel: String, latinLabel: String, family:String, size: Float, femaleWeight: Float, maleWeight:Float){
        super.init(name: name, description: description, webLink: webLink, frenchLabel: frenchLabel, englishLabel: englishLabel, latinLabel: latinLabel, family:family, size: size, femaleWeight: femaleWeight, maleWeight:maleWeight)
    }
    override init(name: String, description: String, webLink: String){
        super.init(name: name, description: description, webLink: webLink)
        
    }
}
