//
//  EditViewController.swift
//  Persistency
//
//  Created by Jonas Wolter on 19.10.20.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    var persistencyPerson : Persistency.Person!
    
    var didSaveCallback : (() -> Void)?


    @IBOutlet weak var tfName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tfName.text = persistencyPerson?.name;
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        persistencyPerson.name = tfName.text!;
        
        do {
            try persistentContainer.viewContext.save()
            
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        didSaveCallback?();
        
//        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
