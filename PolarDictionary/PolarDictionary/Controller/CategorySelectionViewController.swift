//
//  CategorySelectionViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 10/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//
import UIKit
import os.log

class CategorySelectionViewController: UIViewController {
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
    }
    
    //MARK: Actions

    @IBAction func showFauna(_ sender: UIButton) {
        let elementListController = storyboard?.instantiateViewController(withIdentifier: "ElementTableViewController") as! ElementTableViewController
        let newElement1 = Element(name: "chien",description: "je suis un chien", webLink: "chien.org")
        let newElement2 = Element(name: "chat",description: "je suis un chat", webLink: "chat.org")
        elementListController.elementList.append(newElement1)
        elementListController.elementList.append(newElement2)
        navigationController?.pushViewController(elementListController, animated: true)
    }
    
}
