//
//  FruitManager.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import Foundation
import RealmSwift


protocol FruitManagerDelegate {
    func didUpdateFruit(fruitManager: FruitManager, fruit: FruitModel)
    func didFailWithError(error: Error)
    
}

struct FruitManager {
    let url = "https://www.fruityvice.com/api/fruit/"
    
    var realm = try! Realm()
    
    var delegate: FruitManagerDelegate?
    
    func fetchData(fruitName: String) {
        let urlString = "\(url)\(fruitName)"
        print(urlString)
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // Create a URL
        if let url = URL(string: urlString) {
            // Create a URLSesion
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let fruit = self.parseJSON(safeData) {
                        self.delegate?.didUpdateFruit(fruitManager: self, fruit: fruit)
                    }
                }
            }
            // Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ fruitData: Data) -> FruitModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FruitData.self, from: fruitData)
            print(decodedData)
            let genus = decodedData.genus
            let name = decodedData.name
            let family = decodedData.family
            let order = decodedData.order
            let carbohydrates = decodedData.nutritions.carbohydrates
            let protein = decodedData.nutritions.protein
            let calories = decodedData.nutritions.calories
            let sugar = decodedData.nutritions.sugar
            let fat = decodedData.nutritions.fat
            
            let fruit = FruitModel(genus: genus, name: name, family: family, order: order, carbohydrates: carbohydrates, protein: protein, calories: calories, sugar: sugar, fat: fat)
            
            return fruit
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

