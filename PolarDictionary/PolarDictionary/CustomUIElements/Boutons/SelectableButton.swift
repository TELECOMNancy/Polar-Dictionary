//
//  SelectableButton.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit

class SelectableButton: UIButton {
    
    var Couleur: String
    var isOn = false

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        self.Couleur = ""
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.Couleur = ""
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0).cgColor
        layer.borderWidth = 0.0
        addTarget(self, action: #selector(SelectableButton.toggle), for: .touchUpInside)
        isOn = false
    }
    
    @objc func toggle() {
        isOn = !isOn
        layer.borderWidth = isOn ? 2.0 : 0.0
    }
    
    
}
