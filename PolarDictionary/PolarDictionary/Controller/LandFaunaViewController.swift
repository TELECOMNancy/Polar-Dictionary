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
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var webLinkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frenchNameLabel.text = data?.frenchName
        
        latinLabel.text = data?.latinName
        
        image.image = UIImage(named: "Image")
        
        if(data?.floraType?.name != ""){typeLabel.text = data?.floraType?.name} else{typeLabel.text = "inconnu"}
        
        if(data?.family != ""){familyLabel.text = "Famille des " + (data?.family)!} else{familyLabel.text = "Famille inconnue"}
        
        if(data?.description != ""){descriptionLabel.text = data?.description_} else{descriptionLabel.text = "Aucune description"}
        
        sepalsPetalsLabel.text = ""
        if(data?.nbStamens != -1 && data?.nbStamens == 1000){
            sepalsPetalsLabel.text?.append("nombreuses étamines")
        }
        else if (data?.nbStamens != -1 ){
            sepalsPetalsLabel.text?.append("\(data?.nbStamens ?? 0) étamines")
        }
        if(data?.nbPetals != ""){
            if(sepalsPetalsLabel.text != ""){
                sepalsPetalsLabel.text?.append(" - ")
            }
            
                sepalsPetalsLabel.text?.append((data?.nbPetals)! + " pétales")
        }
        
        /*if(data?.petalColors?.count != 0){
         if(sepalsPetalsLabel.text?.contains("pétales"))!{
         sepalsPetalsLabel.text?.append((data?.petalColors![0]))
         }
         sepalsPetalsLabel.text?.append(" pétales " + (data?.petalColors![0]))
         }*/
        
        if(data?.realHeight != ""){
            heightLabel.text = data?.realHeight
        }
        else{
            heightLabel.text = "Aucune information"
        }
        
        if(data?.countries != ""){
            locationLabel.text = data?.countries
        }
        else{
            locationLabel.text = "Aucune information"
        }
        
        if(data?.webLink == ""){
            webLinkButton.isHidden = true
        }

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
    @IBAction func goToWebLink(_ sender: UIButton) {
        if let url = URL(string: (data?.webLink)!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
 

}
