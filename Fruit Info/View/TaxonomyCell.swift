//
//  TaxonomyCell.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 29/03/21.
//

import UIKit


class TaxonomyCell: UICollectionViewCell {
    
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        imageView.layer.masksToBounds = true
        
        imageView.layer.borderWidth=1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.clipsToBounds = true
    }
}
