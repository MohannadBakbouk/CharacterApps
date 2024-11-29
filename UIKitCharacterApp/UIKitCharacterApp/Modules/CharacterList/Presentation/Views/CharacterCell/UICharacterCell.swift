//
//  UICharacterCell.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import UIKit
import Kingfisher
import SnapKit

final class UICharacterCell: UICollectionViewCell {
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.kf.indicatorType = .activity
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.accessibilityIdentifier = "CharacterImageView"
        return image
     }()
    
    private var nameLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor(.title)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private var speciesLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines  = 1
        label.textColor = UIColor(.subtitle)
        label.font = .boldSystemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    private var emptyView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }()
    
    private lazy var infoStack : UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [nameLabel, speciesLabel, emptyView])
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var mainStack : UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [imageView, infoStack])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func setupViews(){
        layer.borderColor = UIColor(.darkBorder).cgColor
        clipsToBounds = true
        layer.cornerRadius = 16
        contentView.addSubview(mainStack)
        setupViewsConstraints()
    }
    
    private func setupViewsConstraints(){
        mainStack.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).offset(15)
            $0.bottom.trailing.equalTo(contentView).offset(-15)
        }
        
        imageView.snp.makeConstraints{
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.25)
            $0.height.equalTo(mainStack.snp.height)
        }
    }
    
    func configure(with model: CharacterViewData){
        nameLabel.text = model.name
        speciesLabel.text = model.species
        backgroundColor = model.style.background
        layer.borderWidth = model.style.hasBorder ? 1.0 : 0.0
        guard let url = model.imageUrl else { return}
        imageView.kf.setImage(with: url)
    }
}
