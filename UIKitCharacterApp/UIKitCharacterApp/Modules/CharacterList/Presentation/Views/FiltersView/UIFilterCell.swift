//
//  UIFilterCell.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

final class UIFilterCell: UICollectionViewCell {

    private var textLabel : UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 18)
      label.textColor = UIColor(.title)
      return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews(){
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.borderColor = UIColor(.darkBorder).cgColor
        layer.borderWidth = 1
        contentView.addSubview(textLabel)
        setupViewsConstraints()
        
    }
    
    private func setupViewsConstraints(){
        textLabel.snp.makeConstraints {$0.centerX.centerY.equalTo(contentView)}
    }

    
    func setFilter(_ item : StatusViewData){
        textLabel.text = item.text
    }
}
