//
//  CollectionReusableViewHeader.swift
//  CollectionViewHorHed
//
//  Created by Kishor Pahalwani on 08/06/20.
//  Copyright © 2020 Kishor Pahalwani. All rights reserved.
//

import UIKit

class CollectionReusableViewHeader: UICollectionReusableView {

    @IBOutlet weak var imgData: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let layer = UIView()
        //layer.frame = CGRect(x: 16, y: 1126, width: 158, height: 208)
        imgData.backgroundColor = UIColor(red: 0.98, green: 0.84, blue: 0.89, alpha: 1)
        imgData.layer.cornerRadius = 6
        imgData.layer.shadowOffset = CGSize(width: 0, height: 1)
        imgData.layer.shadowColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.1).cgColor
        imgData.layer.shadowOpacity = 1
        imgData.layer.shadowRadius = 3
    }
}
