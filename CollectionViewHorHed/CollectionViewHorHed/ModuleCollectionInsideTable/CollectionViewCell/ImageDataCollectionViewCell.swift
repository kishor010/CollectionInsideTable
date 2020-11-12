//
//  ImageDataCollectionViewCell.swift
//  MasonaryGrid
//
//  Created by Kishor Pahalwani on 08/06/20.
//  Copyright © 2020 Kishor Pahalwani. All rights reserved.
//

import UIKit

class ImageDataCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    
    var colors: [UIColor] = [UIColor(red: 0.71, green: 0.94, blue: 0.9, alpha: 1), UIColor(red: 0.42, green: 0.71, blue: 0.39, alpha: 1), UIColor.blue ,UIColor(red: 0.93, green: 0.49, blue: 0.19, alpha: 1)]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bringSubviewToFront(itemImage)
    }
    
    func populateData(atItemIndex: Int) {
        
        if colors.count > atItemIndex {
            itemBackground(color: colors[atItemIndex])
        }
    }
    
    fileprivate func itemBackground(color: UIColor) {
        itemImage.backgroundColor = color
        itemImage.layer.cornerRadius = 6
        itemImage.layer.shadowOffset = CGSize(width: 0, height: 1)
        itemImage.layer.shadowColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.1).cgColor
        itemImage.layer.shadowOpacity = 1
        itemImage.layer.shadowRadius = 3
    }
}
