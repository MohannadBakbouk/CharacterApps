//
//  UIFiltersView.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit
import Combine

final class UIFiltersView: UIView{
   let padding: CGFloat = 5
   var onSelectedItem: PassthroughSubject<StatusViewData, Never> = .init()
    
   private lazy var collectionView : UICollectionView = {
        let collection = UICollectionView(frame: .zero , collectionViewLayout: collectionViewLayout)
        collection.backgroundColor = .clear
        collection.allowsMultipleSelection = false
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    private lazy var collectionViewLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews(){
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UIFilterCell.self)
        setupConstraints()
        setupFilterCollectionCellSize()
    }
    
    private func setupConstraints(){
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    
    private func setupFilterCollectionCellSize(){
        let width = (UIScreen.main.bounds.width / 3.6) - padding
        collectionViewLayout.itemSize = CGSize(width: width , height: 45)
    }
}


extension UIFiltersView : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StatusViewData.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: UIFilterCell.self, for: indexPath) as! UIFilterCell
        cell.setFilter(StatusViewData.allCases[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectedItem.send(StatusViewData.allCases[indexPath.row])
    }
}

