//
//  MasonryGridViewController.swift
//  CollectionViewHorHed
//
//  Created by Kishor Pahalwani on 08/06/20.
//  Copyright © 2020 Kishor Pahalwani. All rights reserved.
//

import UIKit

class TableCollVC: UIViewController {

    @IBOutlet weak var tableViewData: UITableView!
    
    let cellWidthHeader: CGFloat = 0.4
    let cellWidthItems = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        //tableViewData.separatorStyle = .none
        tableViewData.delegate = self
        tableViewData.dataSource = self
        tableViewData.tableFooterView = UIView()
    }
}

//MARK:- Table data delegate and datasource
extension TableCollVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewGridCelll") as? TableViewGridCelll
             if (nil == cell) {
                 let nib:Array = Bundle.main.loadNibNamed("TableViewGridCelll", owner: self, options: nil)!
                 cell = nib[0] as? TableViewGridCelll
             }
             
            cell?.selectionStyle = .gray
            //cell?.populateData(member: members[indexPath.row])
             return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewGridCelll else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = 100
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK:- Collection view delegate and datasource
extension TableCollVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageDataCollectionViewCell", for: indexPath) as? ImageDataCollectionViewCell
         if (nil == cell) {
             let nib:Array = Bundle.main.loadNibNamed("ImageDataCollectionViewCell", owner: self, options: nil)!
             cell = nib[0] as? ImageDataCollectionViewCell
         }
        cell?.populateData(atItemIndex: indexPath.row)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {
        // 2
        case UICollectionView.elementKindSectionHeader:
          // 3
          guard
            let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "\(CollectionReusableViewHeader.self)",
              for: indexPath) as? CollectionReusableViewHeader
            else {
              fatalError("Invalid view type")
          }
          
          print(headerView)
          print(headerView.imgData ?? "")
          return headerView
          default:
          assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidthForItems = collectionView.bounds.width - collectionView.bounds.size.width * cellWidthHeader - 16.0
        print(collectionWidthForItems)
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let collectionHeightForItems = (collectionView.bounds.size.height - (collectionViewLayout?.minimumInteritemSpacing ?? 2))
        return CGSize(width: collectionWidthForItems / 2 + 8, height:collectionHeightForItems / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width * cellWidthHeader - 20.0), height: collectionView.bounds.size.height)
    }
}




