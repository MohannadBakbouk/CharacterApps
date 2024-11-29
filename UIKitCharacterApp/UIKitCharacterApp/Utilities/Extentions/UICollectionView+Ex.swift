//
//  UICollectionView+Ex.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit
import SnapKit

extension UICollectionView{
    func setMessage(_ message : String , icon : String = Images.exclamationmark){
        let view = UIView()
        self.backgroundView = view
        
        let msgLabel = UILabel()
        msgLabel.textAlignment = .center
        msgLabel.textColor = .lightGray
        msgLabel.numberOfLines = 2
        msgLabel.lineBreakMode = .byTruncatingMiddle
        msgLabel.text = message
        view.addSubview(msgLabel)

        let imgView  = UIImageView()
        imgView.image = UIImage(systemName : icon)!
    
        imgView.tintColor = .lightGray
        imgView.contentMode = .scaleAspectFit
        view.addSubview(imgView)
        
        imgView.snp.makeConstraints { maker in
            maker.width.height.equalTo(50)
            maker.centerX.equalTo(view.snp.centerX)
            maker.centerY.equalTo(view.snp.centerY).offset(-75)
        }
        
        msgLabel.snp.makeConstraints { maker in
            maker.height.equalTo(60)
            maker.leading.equalTo(view.snp.leading).offset(10)
            maker.trailing.equalTo(view.snp.trailing).offset(-10)
            maker.top.equalTo(imgView.snp.bottom).offset(10)
        }
    }
    
    func hideMessage(){
        self.backgroundView = nil
    }
    
    func register(_ cellClass: AnyClass){
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass.self))
    }
    
    func dequeueReusableCell(with cellClass: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell?{
        dequeueReusableCell(withReuseIdentifier: String(describing: cellClass.self), for: indexPath)
    }
    
    func setupLoadingIndicator(){
        let indicator = UIActivityIndicatorView()
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = .title
        indicator.hidesWhenStopped = true
        backgroundView = indicator
    }
    
    func toggleLoadingIndicator(_ status : Bool){
        guard let indicator = backgroundView as? UIActivityIndicatorView else {return}
        _ = status ? indicator.startAnimating() : indicator.stopAnimating()
    }
}
