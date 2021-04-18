//
//  CollectionViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 16/04/21.
//

import UIKit
import ChameleonFramework

class CollectionViewController: UIViewController {
    
    // Variable
    let categoryLabel: [String] = [
    "Animal", "Fruit",
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewCell: UICollectionViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCategoryIdentifier", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 8.0
        cell.categoryLabel.text = categoryLabel[indexPath.row]
        cell.categoryLabel.textColor = ContrastColorOf(UIColor.randomFlat(), returnFlat: true)
        cell.imageView.image = UIImage(named: categoryLabel[indexPath.row])
        cell.backgroundColor = UIColor.randomFlat()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            switch indexPath.row {
            case 0:
                let CAnimalVC = storyboard?.instantiateViewController(identifier: "detailCollectionAnimal") as! CAnimalViewController
                CAnimalVC.title = "Animal Collection"
                self.navigationController?.pushViewController(CAnimalVC, animated: true)
            case 1:
                let CFruitVC = storyboard?.instantiateViewController(identifier: "detailCollectionFruit") as! CFruitViewController
                CFruitVC.title = "Fruit Collection"
                self.navigationController?.pushViewController(CFruitVC, animated: true)
            default:
                return
            }
        
    }

    
}
