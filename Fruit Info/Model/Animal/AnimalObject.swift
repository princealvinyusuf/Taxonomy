//
//  AnimalObject.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 16/04/21.
//

import Foundation
import RealmSwift

class AnimalObject: Object {
    
    @objc dynamic var alpha: String = ""
    @objc dynamic var family: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var kingdom: String = ""
    @objc dynamic var phylum: String = ""
    @objc dynamic var animalClass: String = ""
    @objc dynamic var order: String = ""
    @objc dynamic var genus: String = ""
    @objc dynamic var species: String = ""
    @objc dynamic var photo: String = ""
    
}
