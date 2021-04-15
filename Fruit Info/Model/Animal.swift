//
//  Animal.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 05/04/21.
//

import Foundation

struct AnimalElement: Codable {
    let name, alpha, kingdom, phylum: String
    let animalClass, order, family, genus: String
    let species, conservationStatus: String
    let locations: [String]
    let animalDescription: String
    let diet: [String]
    let photo: String
    let lifeSpan: String

    enum CodingKeys: String, CodingKey {
        case name, alpha, kingdom, phylum
        case animalClass = "class"
        case order, family, genus, species, conservationStatus, locations
        case animalDescription = "description"
        case diet, photo, lifeSpan
    }
}

typealias Animal = [AnimalElement]
