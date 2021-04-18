//
//  ViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit
import RealmSwift

class FruitViewController: UIViewController {
    
    var realm = try! Realm()
    
    var fruitManager = FruitManager()
    var fruitModel = FruitModel()
    
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var buttonCollection: UIButton!
    
    @IBOutlet weak var imageEmpty: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var informationView: UIView!
    
    func hiddenComponent() {
        nameLabel.isHidden = true
        genusLabel.isHidden = true
        familyLabel.isHidden = true
        orderLabel.isHidden = true
        carbohydratesLabel.isHidden = true
        proteinLabel.isHidden = true
        fatLabel.isHidden = true
        caloriesLabel.isHidden = true
        sugarLabel.isHidden = true
        buttonCollection.isHidden = true
        informationView.isHidden = true
        emptyLabel.isHidden = false
        imageEmpty.isHidden = false
    }
    
    func showComponent() {
        nameLabel.isHidden = false
        genusLabel.isHidden = false
        familyLabel.isHidden = false
        orderLabel.isHidden = false
        carbohydratesLabel.isHidden = false
        proteinLabel.isHidden = false
        fatLabel.isHidden = false
        caloriesLabel.isHidden = false
        sugarLabel.isHidden = false
        buttonCollection.isHidden = false
        informationView.isHidden = false
        emptyLabel.isHidden = true
        imageEmpty.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        fruitManager.delegate = self
        setSearchController()
        
        tabBarController?.tabBar.isHidden = true
        
        hiddenComponent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func setSearchController() {
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Fruit Name"
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
    }
    
    @IBAction func collectionButtonPressed(_ sender: Any) {
        let newFruit = FruitObject()
        newFruit.genus = genusLabel.text!
        newFruit.name = nameLabel.text!
        newFruit.family = familyLabel.text!
        newFruit.order = orderLabel.text!
        newFruit.carbohydrates = carbohydratesLabel.text!
        newFruit.protein = proteinLabel.text!
        newFruit.calories = caloriesLabel.text!
        newFruit.sugar = sugarLabel.text!
        newFruit.fat = fatLabel.text!

        save(with: newFruit)
        
        let alert = UIAlertController(title: "Successfully", message: "Data has successful saved", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - DATA MANIPULATION IN REALM DATABASE
    
    func save(with fruit: FruitObject) {
        // Action to add data
        do {
            try realm.write {
                realm.add(fruit)
            }
        } catch {
            print("Error saving category \(error)")
        }
        
        
    }
    
}




// MARK: - SEARCHBAR FUNCTION

extension FruitViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Inputing")
        
        if let safeSearch = searchBar.text {
            print(safeSearch)
            fruitManager.fetchData(fruitName: safeSearch)
            
        }
    
    }
    
}



// MARK: - FRUITMANAGER DELEGATE
extension FruitViewController: FruitManagerDelegate {
    func didUpdateFruit(fruitManager: FruitManager, fruit: FruitModel) {
        DispatchQueue.main.async {
            self.genusLabel.text = fruit.genus
            self.familyLabel.text = fruit.family
            self.orderLabel.text = fruit.order
            self.carbohydratesLabel.text = String(fruit.carbohydrates)
            self.proteinLabel.text = String(fruit.protein)
            self.fatLabel.text = String(fruit.fat)
            self.caloriesLabel.text = String(fruit.calories)
            self.sugarLabel.text = String(fruit.sugar)
            self.nameLabel.text = String(fruit.name)
            self.showComponent()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}


