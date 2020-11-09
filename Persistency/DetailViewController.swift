//
//  DetailViewController.swift
//  Persistency
//
//  Created by Jonas Wolter on 19.10.20.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    var persistencyPerson : Persistency.Person!

    @IBOutlet weak var labelAppearanceCounter: UILabel!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        labelName.text = persistencyPerson.name;
        updateAppearanceCount()
    }
    
    func updateAppearanceCount(){
        let defaults = UserDefaults.standard
        var count = defaults.integer(forKey: "DetailViewAppearanceCount")
        count += 1;
        self.labelAppearanceCounter.text = "Total View Appearance: " + count.description;
        defaults.set(count, forKey: "DetailViewAppearanceCount")
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
    
        print(self.children)
        
//        let evc = EditViewController();
//
//        evc.persistentContainer = self.persistentContainer
//        evc.persistencyPerson = persistencyPerson
        
//        show(evc, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let evc : EditViewController = segue.destination as? EditViewController{
            evc.persistentContainer = self.persistentContainer
            evc.persistencyPerson = persistencyPerson
            evc.didSaveCallback = {
                self.labelName.text = self.persistencyPerson.name;
            }
        }
    }
    
    
    

}
