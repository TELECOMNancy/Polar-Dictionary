//
//  Element.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import Foundation

class Element{
    var name : String
    var description : String
    var webLink : String
    
    init(name: String, description: String, webLink: String){
        self.name = name
        self.description = description
        self.webLink = webLink
    }
}
