//
//  Naturals.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation
class Naturals : Element{
    var frenchLabel : String
    var englishLabel : String
    var latinLabel : String
    var family : String
    
    init(name: String, description: String, webLink: String, frenchLabel: String, englishLabel: String, latinLabel: String, family: String){
        self.frenchLabel = frenchLabel
        self.englishLabel = englishLabel
        self.latinLabel = latinLabel
        self.family = family
        super.init(name: name,description: description, webLink: webLink)
    }
    override init(name: String, description: String, webLink: String){
        self.frenchLabel = ""
        self.englishLabel = name
        self.latinLabel = ""
        self.family = ""
        super.init(name: name, description: description, webLink: webLink)
    }
}
