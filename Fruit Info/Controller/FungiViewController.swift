//
//  FungiViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit

class FungiViewController: UIViewController {
    
    let itemArray = ["strawberry", "lemon", "jeruk"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var fruitManager = FruitManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension FungiViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Pressed")
        if let safeSearch = searchBar.text {
            print(safeSearch)
            fruitManager.fetchData(fruitName: safeSearch)
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel Pressed")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Inputing")
    }
}

