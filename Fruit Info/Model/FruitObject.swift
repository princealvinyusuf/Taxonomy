//
//  FruitObject.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import Foundation
import RealmSwift

class FruitObject: Object {
    
    @objc dynamic var genus: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var family: String = ""
    @objc dynamic var order: String = ""
    @objc dynamic var carbohydrates: String = ""
    @objc dynamic var protein: String = ""
    @objc dynamic var calories: String = ""
    @objc dynamic var sugar: String = ""
    @objc dynamic var fat: String = ""
}
