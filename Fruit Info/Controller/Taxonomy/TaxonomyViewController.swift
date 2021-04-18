//
//  TaxonomyViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit
import CardsLayout
import ChameleonFramework

class TaxonomyViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var classLabel: [String] = [
        "Animal", "Fruit",
    ]
    
    var classImage: [UIImage?] = [
        UIImage(named: "orangutan"),
        UIImage(named: "tree"),
    ]
    
    var introductionWord: [String] = [
        "Animal kingdom classification is an important system for understanding how all living organisms are related. Based on the Linnaeus method, species are arranged grouped based on shared characteristics. This system of animal kingdom classification was developed by Swedish botanist Carolus Linnaeus in the 1700’s.", "There are two common types of fruit classifications: those that are fleshy and those that are dry. And then there are the subdivisions under each of those categories. Fruit varieties are further classified depending upon their different seed dispersal methods."
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
        return classLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let randomColor = UIColor.randomFlat()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath) as! TaxonomyCell
        cell.layer.cornerRadius = 8.0
        cell.backgroundColor = randomColor
        cell.classLabel.text = classLabel[indexPath.row]
        cell.classLabel.textColor = ContrastColorOf(randomColor, returnFlat: true)
        cell.imageView.image = classImage[indexPath.row]
        cell.introductionLabel.text = introductionWord[indexPath.row]
        cell.introductionLabel.textColor = ContrastColorOf(randomColor, returnFlat: true)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "animalSegue", sender: self)
        case 1:
            self.performSegue(withIdentifier: "fruitSegue", sender: self)
        default:
            print("Default")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "animalSegue" {
            segue.destination as! AnimalViewController
        }
        
        if segue.identifier == "fruitSegue" {
            segue.destination as! FruitViewController
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
