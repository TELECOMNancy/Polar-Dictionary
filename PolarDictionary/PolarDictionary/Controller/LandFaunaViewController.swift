//
//  LandFaunaViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit

class LandFaunaViewController: UIViewController {
    
    //@IBOutlet weak var navigationBar: UINavigationBar!
    var data: FloraMO?

    @IBOutlet weak var image: UIImageView!
    //@IBOutlet weak var familyLabel: UILabel!
    //@IBOutlet weak var descriptionLabel: UILabel!
    //@IBOutlet weak var sizeLabel: UILabel!
    //@IBOutlet weak var femaleWeightLabel: UILabel!
    //@IBOutlet weak var maleWeightLabel: UILabel!
    //@IBOutlet weak var webLinkButton: UIButton!
    
    
    
    @IBOutlet weak var frenchNameLabel: UILabel!
    @IBOutlet weak var latinLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sepalsPetalsLabel: UILabel!
    @IBOutlet weak var stemLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frenchNameLabel.text = data?.frenchName
        latinLabel.text = data?.latinName
        image.image = UIImage(named: "Image")
        //filling of famillyLabel
        if(data?.family != ""){
            familyLabel.text = "Famille des " + (data?.family)!
        }
        else{
            familyLabel.text = "Famille inconnue"
        }
        //filling of typeLabel
        /*if(data?.floraType != ""){
            typeLabel.text = (data?.type)!
        }
        else{
            typeLabel.text = "type inconnu"
        }*/
        //descriptionLabel.text = data?.description_
        
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
