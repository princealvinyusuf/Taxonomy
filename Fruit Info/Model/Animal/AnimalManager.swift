//
//  AnimalManager.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 05/04/21.
//

import Foundation

protocol AnimalManagerDelegate {
    func didFailWithError(error: Error)
    func updateData(animalManager: AnimalManager, animalModel: AnimalModel)
}

struct AnimalManager {
    
    let url = "http://www.animaliarestapi.com/name/"
    
    var delegate: AnimalManagerDelegate?
    
    func fetchData(name animalName: String) {
        let completeURL = "\(url)\(animalName)"
        
        print(completeURL)
        performRequest(urlString: completeURL)
    }
    
    func performRequest(urlString: String) {
        
        // Create a url
        
        if let url = URL(string: urlString) {
            // Create a session
            let session = URLSession(configuration: .default)
            
            // Give a session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    print(safeData)
                    
                    if let animal = self.parseJSON(data: safeData) {
                        self.delegate?.updateData(animalManager: self, animalModel: animal)
                    }
                    
                }
            }
            // Execution
            task.resume()
        }
        
    }
    
    func parseJSON(data: Data) -> AnimalModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Animal.self, from: data)
            
            let name = decodedData[0].name
            let alpha = decodedData[0].alpha
            let kingdom = decodedData[0].kingdom
            let phylum = decodedData[0].phylum
            let animalClass = decodedData[0].animalClass
            let order = decodedData[0].order
            let family = decodedData[0].family
            let genus = decodedData[0].genus
            let species = decodedData[0].species
            
            var animalModel = AnimalModel()
            animalModel.alpha = alpha
            animalModel.family = family
            animalModel.name = name
            animalModel.kingdom = kingdom
            animalModel.phylum = phylum
            animalModel.animalClass = animalClass
            animalModel.order = order
            animalModel.genus = genus
            animalModel.species = species
            
            print(animalModel)
            return animalModel
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
        
        
    }
    
}
