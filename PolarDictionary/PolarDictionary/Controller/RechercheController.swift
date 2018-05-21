//
//  RechercheController.swift
//  PolarDictionary
//
//  Created by Syméon Carle on 21/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var nbPetalsLabel: UILabel!
    @IBOutlet weak var nbSepalsLabel: UILabel!
    @IBOutlet weak var nbEtaminesLabel: UILabel!
    

    
    var typesFlora = [String]()
    var formesFeuilles = [String]()
    var hauteurs = [String]()
    var Lieux = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        self.nbPetalsLabel.text = "0"
        self.nbSepalsLabel.text = "0"
        self.nbEtaminesLabel.text = "0"
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
            guard let ETVC = segue.destination as? ElementTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            // fait ta tambouille avec les sélécteurs et les options
            
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
