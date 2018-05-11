//
//  Fauna.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation
class Fauna : Naturals{
    var size : Float
    var femaleWeight: Float
    var maleWeight: Float
    
    init(name: String, description: String, webLink: String, frenchLabel: String, englishLabel: String, latinLabel: String, family:String, size: Float, femaleWeight: Float, maleWeight:Float){
        self.size = size
        self.femaleWeight = femaleWeight
        self.maleWeight = maleWeight
        super.init(name: name, description: description, webLink: webLink, frenchLabel: frenchLabel, englishLabel: englishLabel, latinLabel: latinLabel, family:family)
    }
    override init(name: String, description: String, webLink: String){
        self.size = -1
        self.femaleWeight = -1
        self.maleWeight = -1
        super.init(name: name, description: description, webLink: webLink)
    }
}
