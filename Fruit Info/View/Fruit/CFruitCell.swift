//
//  CollectionCell.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 27/03/21.
//

import UIKit

class CFruitCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    @IBOutlet weak var genusTag: UILabel!
    @IBOutlet weak var familyTag: UILabel!
    @IBOutlet weak var orderTag: UILabel!
    @IBOutlet weak var carbohydratesTag: UILabel!
    @IBOutlet weak var proteinTag: UILabel!
    @IBOutlet weak var fatTag: UILabel!
    @IBOutlet weak var caloriesTag: UILabel!
    @IBOutlet weak var sugarTag: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}
