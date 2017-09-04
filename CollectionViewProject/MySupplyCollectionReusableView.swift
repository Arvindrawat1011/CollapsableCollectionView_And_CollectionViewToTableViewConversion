//
//  MySupplyCollectionReusableView.swift
//  CollectionViewProject
//
//  Created by Appinventiv Technologies on 31/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class MySupplyCollectionReusableView: UICollectionReusableView{
   
   
    @IBOutlet weak var footer: UILabel!
    
    @IBOutlet weak var headerLabel: UILabel!
    
  func collectionView(collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: MySupplyCollectionReusableView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                    withReuseIdentifier: "header", for: indexPath as IndexPath)
                    as? MySupplyCollectionReusableView
    header?.headerLabel.text = "Car Image Gallery"
    header?.footer.text = "adadada"
            }
            return header!
    }
    
   
        
}
