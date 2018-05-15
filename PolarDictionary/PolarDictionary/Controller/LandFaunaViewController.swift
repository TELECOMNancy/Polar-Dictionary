//
//  LandFaunaViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit

class LandFaunaViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    //var landFauna : LandFauna?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var femaleWeightLabel: UILabel!
    @IBOutlet weak var maleWeightLabel: UILabel!
    @IBOutlet weak var webLinkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*// Do any additional setup after loading the view.
        nameLabel.text = landFauna?.name
        latinNameLabel.text = landFauna?.latinLabel
        //image
        familyLabel.text = "Famille des " + (landFauna?.family)!
        descriptionLabel.text = landFauna?.description
        //webLinkButton.truc = landFauna?.webLink
        //TODO: self.landFauna.loadInfo()
        //latinNameLabel.text = landFauna?.latinLabel etc...*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
