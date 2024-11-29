//
//  UICollectionView+Ex.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import UIKit

extension UICollectionView{
    
    func register(_ cellClass: AnyClass){
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass.self))
    }
    
    func dequeueReusableCell(with cellClass: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell?{
        dequeueReusableCell(withReuseIdentifier: String(describing: cellClass.self), for: indexPath)
    }
    
    func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String){
        register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: String(describing: viewClass.self))
    }
    
    func dequeueReusableSupplementaryView(_ viewClass: AnyClass?, ofKind: String, for indexPath: IndexPath) ->  UICollectionReusableView{
        dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: String(describing: viewClass.self), for: indexPath)
    }
    
    func hideScrollIndicators(){
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    
}
