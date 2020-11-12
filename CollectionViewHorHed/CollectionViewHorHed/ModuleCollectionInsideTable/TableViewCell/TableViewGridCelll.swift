//
//  TableViewGridCelll.swift
//  CollectionViewHorHed
//
//  Created by Kishor Pahalwani on 08/06/20.
//  Copyright © 2020 Kishor Pahalwani. All rights reserved.
//

import UIKit

class TableViewGridCelll: UITableViewCell {
    
    @IBOutlet weak var collectionItems: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        let nib1:UINib = UINib(nibName: "CollectionReusableViewHeader", bundle: nil)
               self.collectionItems.register(nib1, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableViewHeader")
               collectionItems.register(UINib(nibName: "ImageDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageDataCollectionViewCell")
               setCustomLayout()
    }
    
    fileprivate func setCustomLayout() {
        let collectionViewLayout = collectionItems.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.minimumInteritemSpacing = 2
        collectionViewLayout?.minimumLineSpacing = 4
        collectionViewLayout?.invalidateLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionItems.delegate = dataSourceDelegate
        collectionItems.dataSource = dataSourceDelegate
        collectionItems.tag = row
        collectionItems.reloadData()
    }
}
