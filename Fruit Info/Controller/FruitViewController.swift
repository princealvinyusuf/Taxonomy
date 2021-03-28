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
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        fruitManager.delegate = self
        setImageView()
        setSearchController()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - PROPERTY SET
    func setImageView() {
        imageView.layer.borderWidth = 2
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
    func setSearchController() {
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search artists"
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
//      searchController.searchResultsUpdater = self.viewModel
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

extension FruitViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Pressed")
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel Pressed")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Inputing")
        
        if let safeSearch = searchBar.text {
            print(safeSearch)
            fruitManager.fetchData(fruitName: safeSearch)
            
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Searching with: " + (searchController.searchBar.text ?? ""))
        let searchText = (searchController.searchBar.text ?? "")
//        self.currentSearchText = searchText
//        search()
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
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

