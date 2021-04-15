//
//  FruitData.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import Foundation

struct FruitData: Codable {
    let name: String
    let genus: String
    let family: String
    let order: String
    let nutritions: Nutritions
}

struct Nutritions: Codable {
    let protein: Float
    let fat: Float
    let calories: Float
    let sugar: Float
    let carbohydrates: Float
}
