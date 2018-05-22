//
//  CreationViewController.swift
//  PolarDictionary
//
//  Created by Anissa Bokhamy on 22/05/2018.
//  Copyright © 2018 PIDR. All rights reserved.
//

import UIKit
import os.log
import CoreData

class CreationViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latinNameTextField: UITextField!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var familyTextField: UITextField!
    @IBOutlet weak var typeSelector: SelecteurFloraType!
    
    
    var fetchedResultsController: NSFetchedResultsController<FloraMO>!
    var request:NSFetchRequest<FloraMO>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    
    // MARK: - Navigation

    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let moc = appDelegate.coreDataManager.managedObjectContext
        let newFlora = NSEntityDescription.insertNewObject(forEntityName: "Flora", into: moc) as! FloraMO
        newFlora.frenchName = nameTextField.text
        newFlora.latinName = latinNameTextField.text
        var selectorsPredicate = NSPredicate(format: "TRUEPREDICATE")
        let selectedType:FloraTypeMO? = typeSelector.getSelectedRawElement() as? FloraTypeMO
        if selectedType != nil {
            print("Type : \(selectedType!.name ?? "(pas de nom)")")
            let typePredicate = NSPredicate(format: "floraType.name == %@",selectedType!.name!)
            selectorsPredicate = NSCompoundPredicate(type: .and, subpredicates: [selectorsPredicate,typePredicate])
        }
        newFlora.floraType = selectedType
        newFlora.family = familyTextField.text
        newFlora.description_ = ""
        newFlora.nbPetals = ""
        newFlora.nbStamens = -1
        newFlora.realHeight = ""
        newFlora.countries = ""
        
        //newFlora.photo = picture.image
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        request = {
            let request = NSFetchRequest<FloraMO>(entityName: "Flora")
            request.returnsObjectsAsFaults = false
            let nameSort = NSSortDescriptor(key: "nbPetals", ascending: true)
            request.sortDescriptors = [nameSort]
            return request
        }()
        
        
        }
    
     @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        latinNameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
     }
     
     /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        picture.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let nameText = nameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
}
