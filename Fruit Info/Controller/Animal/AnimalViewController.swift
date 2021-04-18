//
//  AnimalViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 15/04/21.
//

import UIKit
import RealmSwift

class AnimalViewController: UIViewController {
    
    // Realm
    let realm = try! Realm()
    
    // Object
    var animalManager = AnimalManager()
    let animalModel = AnimalModel()
    
    // UI Component
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var kingdomLabel: UILabel!
    @IBOutlet weak var phylumLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    @IBOutlet weak var emptyImageView: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var btnCollection: UIButton!
    
    func hiddenComponent() {
        imageView.isHidden = true
        nameLabel.isHidden = true
        alphaLabel.isHidden = true
        familyLabel.isHidden = true
        kingdomLabel.isHidden = true
        phylumLabel.isHidden = true
        classLabel.isHidden = true
        orderLabel.isHidden = true
        genusLabel.isHidden = true
        speciesLabel.isHidden = true
        btnCollection.isHidden = true
        uiView.isHidden = true
    }
    
    func showComponent() {
        imageView.isHidden = false
        nameLabel.isHidden = false
        alphaLabel.isHidden = false
        familyLabel.isHidden = false
        kingdomLabel.isHidden = false
        phylumLabel.isHidden = false
        classLabel.isHidden = false
        orderLabel.isHidden = false
        genusLabel.isHidden = false
        speciesLabel.isHidden = false
        btnCollection.isHidden = false
        uiView.isHidden = false
        emptyImageView.isHidden = true
        emptyLabel.isHidden = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchController()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        tabBarController?.tabBar.isHidden = true
        hiddenComponent()
        
        animalManager.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    
    
    func setSearchController() {
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Animal Name"
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
}

// MARK: - ANIMAL MANAGER DELEGATE

extension AnimalViewController: AnimalManagerDelegate  {
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func updateData(animalManager: AnimalManager, animalModel: AnimalModel) {
        
        DispatchQueue.main.async {
            self.alphaLabel.text = animalModel.alpha
            self.familyLabel.text = animalModel.family
            self.nameLabel.text = animalModel.name
            self.kingdomLabel.text = animalModel.kingdom
            self.phylumLabel.text = animalModel.phylum
            self.classLabel.text = animalModel.animalClass
            self.orderLabel.text = animalModel.order
            self.genusLabel.text = animalModel.genus
            self.speciesLabel.text = animalModel.species
            
            let url = URL(string: animalModel.photo)!
            self.downloadImage(from: url)
            
            self.showComponent()
        }
        
        
    }
    
    
}







// MARK: - SEARCH BAR DELEGATE

extension AnimalViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Inputing")
        
        if let safeSearch = searchBar.text {
            print(safeSearch)
            animalManager.fetchData(name: safeSearch)
        }
    }
}



// MARK: - BUTTON PRESSED & DATA MANIPULATION

extension AnimalViewController {
    
    @IBAction func addCollectionPressed(_ sender: UIButton) {
        
        if let alpha = alphaLabel.text, let family = familyLabel.text, let name = nameLabel.text, let kingdom = kingdomLabel.text, let phylum = phylumLabel.text, let animalClass = classLabel.text, let order = orderLabel.text, let genus = genusLabel.text, let species = speciesLabel.text {
            
            let animalObject = AnimalObject()
            animalObject.alpha = alpha
            animalObject.family = family
            animalObject.name = name
            animalObject.kingdom = kingdom
            animalObject.phylum = phylum
            animalObject.animalClass = animalClass
            animalObject.order = order
            animalObject.genus = genus
            animalObject.species = species
            save(animal: animalObject)
            
            let alert = UIAlertController(title: "Successfully", message: "Data has successful saved", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                
                self.navigationController?.popViewController(animated: true)
                
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func save(animal: AnimalObject) {
        do {
            try realm.write {
                realm.add(animal)
            }
        } catch {
            print("Error to save data \(error.localizedDescription)")
        }
        
    }
    
    
    func downloadImage(from url: URL) {
        print("Download Started")
        
        animalManager.getImageData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.imageView.image = UIImage(data: data)
            }
        }
    }
    
    
}




