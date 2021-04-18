//
//  CAnimalViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 17/04/21.
//

import UIKit
import RealmSwift
import CardsLayout
import ChameleonFramework

class CAnimalViewController: UIViewController {
    
    var realm = try! Realm()
    var animalItem: Results<AnimalObject>?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyImageView: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = CardsCollectionViewLayout()
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDatabase()
    }
    
    func loadDatabase() {
        
        animalItem = realm.objects(AnimalObject.self)
        collectionView.reloadData()
        
    }
    

}

extension CAnimalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalItem?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! CAnimalCell
        let random = UIColor.randomFlat()
        
        if let item = animalItem?[indexPath.row] {
            cell.alphaValue.text = item.alpha
            cell.familyValue.text = item.family
            cell.kingdomValue.text = item.kingdom
            cell.phylumValue.text = item.phylum
            cell.classValue.text = item.animalClass
            cell.orderValue.text = item.order
            cell.genusValue.text = item.genus
            cell.speciesValue.text = item.species
            cell.nameValue.text = item.name
            
            cell.alphaValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.familyValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.kingdomValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.phylumValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.classValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.orderValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.genusValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.speciesValue.textColor = ContrastColorOf(random, returnFlat: true)
            cell.nameValue.textColor = ContrastColorOf(random, returnFlat: true)
            
            cell.alphaLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.familyLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.kingdomLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.phylumLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.classLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.orderLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.genusLabel.textColor =  ContrastColorOf(random, returnFlat: true)
            cell.speciesLabel.textColor = ContrastColorOf(random, returnFlat: true)
            
            emptyLabel.isHidden = true
            emptyImageView.isHidden = true
        }
        
        
        
        cell.layer.cornerRadius = 8.0
        cell.backgroundColor = random
        return cell
    }
    
}
