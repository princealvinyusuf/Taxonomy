//
//  TaxonomyViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit
import CardsLayout

class TaxonomyViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors: [UIColor] = [
        UIColor(red: 237, green: 37, blue: 78),
        UIColor(red: 249, green: 220, blue: 92),
        UIColor(red: 194, green: 234, blue: 189),
    ]
    
    var image: [UIImage?] = [
        UIImage(named: "orangutan"),
        UIImage(named: "tree"),
        UIImage(named: "fungi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = CardsCollectionViewLayout()
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
}

extension TaxonomyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath)
        cell.layer.cornerRadius = 8.0
        cell.backgroundColor = colors[indexPath.row]
        cell.backgroundView = UIImageView(image: image[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            switch indexPath.row {
            case 0:
                self.performSegue(withIdentifier: "animalSegue", sender: self)
            case 1:
                self.performSegue(withIdentifier: "fruitSegue", sender: self)
            case 2:
                self.performSegue(withIdentifier: "fungiSegue", sender: self)
            default:
                print("Default")
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animalSegue" {
            let animalVC = segue.destination as! AnimalViewController
        }
        
        if segue.identifier == "fruitSegue" {
            let fruitVC = segue.destination as! FruitViewController
        }
        
        if segue.identifier == "fungiSegue" {
            let fungiVC = segue.destination as! FungiViewController
        }
        
        
        
    }
    
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255 ,
                  green: CGFloat(green)/255,
                  blue: CGFloat(blue)/255,
                  alpha: 1.0)
    }
}
