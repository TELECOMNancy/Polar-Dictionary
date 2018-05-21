//
//  RechercheController.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import CoreData

class RechercheController: UITableViewController {

    @IBOutlet weak var selecteurType: SelecteurFloraType!
    @IBOutlet weak var selecteurFormeFeuilles: SelecteurFormeFeuilles!
    @IBOutlet weak var selecteurHauteur: SelecteurFlowerHeight!
    @IBOutlet weak var selecteurLieu: SelecteurLieu!
    
    @IBOutlet weak var blue: SelectableButton!
    @IBOutlet weak var yellow: SelectableButton!
    @IBOutlet weak var pink: SelectableButton!
    @IBOutlet weak var grey: SelectableButton!
    @IBOutlet weak var white: SelectableButton!
    @IBOutlet weak var purple: SelectableButton!
    @IBOutlet weak var red: SelectableButton!
    @IBOutlet weak var orange: SelectableButton!
    @IBOutlet weak var green: SelectableButton!
    @IBOutlet weak var black: SelectableButton!
    
    var colors = [SelectableButton]()
    
    @IBOutlet weak var PetalsStepper: UIStepper!
    @IBOutlet weak var SepalsStepper: UIStepper!
    @IBOutlet weak var EtaminesStepper: UIStepper!
    
    @IBOutlet weak var nbPetalsLabel: UILabel!
    @IBOutlet weak var nbSepalsLabel: UILabel!
    @IBOutlet weak var nbEtaminesLabel: UILabel!
    

    var typesFlora = [String]()
    var formesFeuilles = [String]()
    var hauteurs = [String]()
    var Lieux = [String]()
    
    var request:NSFetchRequest<FloraMO>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        self.nbPetalsLabel.text = "0"
        self.nbSepalsLabel.text = "0"
        self.nbEtaminesLabel.text = "0"
        colors = [blue,yellow,pink,grey,white,purple,red,orange,green,black]
        blue.Couleur = "bleu"
        yellow.Couleur = "jaune"
        pink.Couleur = "rose"
        grey.Couleur = "gris"
        white.Couleur = "blanc"
        purple.Couleur = "violet"
        red.Couleur = "rouge"
        orange.Couleur = "orange"
        green.Couleur = "vert"
        black.Couleur = "noir"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 8
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    @IBAction func nbPetalsUpdate(_ sender: UIStepper) {
        self.nbPetalsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func nbSepalsUpdate(_ sender: UIStepper) {
        self.nbSepalsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func nbEtaminesUpdate(_ sender: UIStepper) {
        self.nbEtaminesLabel.text = "\(Int(sender.value))"
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "searchToResults":
            if !(segue.destination is ElementTableViewController) {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            // fait ta tambouille avec les sélécteurs et les options
            var selectorsPredicate = NSPredicate(format: "TRUEPREDICATE")
            let typeSéléctionné:FloraTypeMO? = selecteurType.getSelectedRawElement() as? FloraTypeMO
            if typeSéléctionné != nil {
                print("Type : \(typeSéléctionné!.name ?? "(pas de nom)")")
                let typePredicate = NSPredicate(format: "floraType.name == %@",typeSéléctionné!.name!)
                selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [selectorsPredicate,typePredicate])
            }
            
            let formeFeuilleSéléctionné:LeavesShapeMO? = selecteurFormeFeuilles.getSelectedRawElement() as? LeavesShapeMO
            if formeFeuilleSéléctionné != nil  {
                print("Forme des Feuilles : \(formeFeuilleSéléctionné!)")
                let formeFeuillesPredicate = NSPredicate(format: "leavesShape.name == %@", formeFeuilleSéléctionné!.name!)
                selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [selectorsPredicate,formeFeuillesPredicate])
            }
            
            let hauteurSéléctionnée:FlowerHeightMO? = selecteurHauteur.getSelectedRawElement() as? FlowerHeightMO
            if hauteurSéléctionnée != nil {
                print("Hauteur : \(hauteurSéléctionnée!)")
                let hauteurPredicate = NSPredicate(format: "height.name == %@", hauteurSéléctionnée!.name!)
                selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [selectorsPredicate,hauteurPredicate])
                
            }
            
            let lieuSéléctionné:LocationMO? = selecteurLieu.getSelectedRawElement() as? LocationMO
            if lieuSéléctionné != nil {
                print("Lieu : \(lieuSéléctionné!)")
                let lieuPredicate = NSPredicate(format: "ANY location == %@",lieuSéléctionné!)
                selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [selectorsPredicate,lieuPredicate])
            }
            
            //var selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [typePredicate,formeFeuillesPredicate,hauteurPredicate,lieuPredicate])
            
            let nbPetales = Int(PetalsStepper.value)
            print("Pétales : \(nbPetales)")
            let nbSepales = Int(SepalsStepper.value)
            print("Sépales : \(nbSepales)")
            let nbEtamines = Int(EtaminesStepper.value)
            print("Étamines : \(nbEtamines)")
            
            print("Couleurs :")
            
            var colorsPredicates = [NSPredicate]()
            for color in colors {
                if color.isOn {
                    print(color.Couleur)
                    colorsPredicates.append(NSPredicate(format: "ANY petalColors.name == %@",color.Couleur))
                }
            }
            let colorsPredicate:NSPredicate = {
                if colorsPredicates.count == 0 {
                    return NSPredicate(format: "TRUEPREDICATE")
                } else {
                    return NSCompoundPredicate(type: .or, subpredicates: colorsPredicates)
                }
            } ()
            
            let finalPredicate = NSCompoundPredicate(type: .and, subpredicates: [colorsPredicate,selectorsPredicate])
            print("finalPredicate : \(finalPredicate)")
            
            request = {
                let request = NSFetchRequest<FloraMO>(entityName: "Flora")
                request.returnsObjectsAsFaults = false
                let nameSort = NSSortDescriptor(key: "nbPetals", ascending: true)
                request.sortDescriptors = [nameSort]
                request.predicate = finalPredicate
                return request
            }()
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
