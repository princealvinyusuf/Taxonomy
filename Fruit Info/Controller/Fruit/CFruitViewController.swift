//
//  CollectionViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit
import RealmSwift
import CardsLayout
import ChameleonFramework

class CFruitViewController: UIViewController {
    
    var realm = try! Realm()
    var fruitItem: Results<FruitObject>?
    
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
        
        fruitItem = realm.objects(FruitObject.self)
        collectionView.reloadData()
        
    }
    
    
    
    
}

extension CFruitViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitItem?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! CFruitCell
        let random = UIColor.randomFlat()
        
        if let item = fruitItem?[indexPath.row] {
            cell.nameLabel.text = item.name
            cell.caloriesLabel.text = item.calories
            cell.carbohydratesLabel.text = item.carbohydrates
            cell.familyLabel.text = item.family
            cell.fatLabel.text = item.fat
            cell.genusLabel.text = item.genus
            cell.orderLabel.text = item.order
            cell.proteinLabel.text = item.protein
            cell.sugarLabel.text = item.sugar
            
            cell.nameLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.caloriesLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.carbohydratesLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.familyLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.fatLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.genusLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.orderLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.proteinLabel.textColor = ContrastColorOf(random, returnFlat: true)
            cell.sugarLabel.textColor = ContrastColorOf(random, returnFlat: true)
            
            cell.caloriesTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.carbohydratesTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.familyTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.fatTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.genusTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.orderTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.proteinTag.textColor = ContrastColorOf(random, returnFlat: true)
            cell.sugarTag.textColor = ContrastColorOf(random, returnFlat: true)
            
            emptyImageView.isHidden = true
            emptyLabel.isHidden = true
            
        }
        
        cell.layer.cornerRadius = 8.0
        cell.backgroundColor = random
        return cell
    }
    
    
    
}
