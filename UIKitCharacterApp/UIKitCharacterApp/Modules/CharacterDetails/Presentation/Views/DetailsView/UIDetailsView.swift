//
//  UIDetailsView.swift
//  UIKitCharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import UIKit
import Combine
import SnapKit

final class UIDetailsView: UIStackView{
    public var info: CurrentValueSubject<CharacterViewData?, Never> = .init(nil)
    private var cancellables: Set<AnyCancellable> = []
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = UIColor(.title)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private var statusLabel: UIPaddedLabel = {
        let label = UIPaddedLabel()
        label.text = ""
        label.numberOfLines  = 1
        label.textColor = UIColor(.subtitle)
        label.font = .boldSystemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.layer.cornerRadius = 15
        label.backgroundColor = .status
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var nameStatusStack : UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [nameLabel, statusLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    private var speciesLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines  = 1
        label.textColor = UIColor(.subtitle)
        label.font = .boldSystemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private var dotLabel : UILabel = {
        let label = UILabel()
        label.text = "."
        label.textColor = UIColor(.subtitle)
        label.font = .boldSystemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private var genderLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(.subtitle)
        label.font = .boldSystemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var speciesGenderStack : UIStackView =  {
        let stack = UIStackView(arrangedSubviews: [speciesLabel, dotLabel, genderLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
        
    private var locationView: UILocationView = {
        return UILocationView()
    }()
    
    
    private class UILocationView: UIView{
        
        private var locationLabel : UILabel = {
            let label = UILabel()
            label.text = "Location : "
            label.font = .boldSystemFont(ofSize: 18)
            label.textColor = UIColor(.title)
            label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            return label
        }()
        
        private var locationValueLabel : UILabel = {
            let label = UILabel()
            label.text = ""
            label.numberOfLines  = 2
            label.textColor = UIColor(.subtitle)
            label.font = .boldSystemFont(ofSize: 16)
            label.setContentHuggingPriority(.defaultLow, for: .horizontal)
            return label
        }()
        
        private lazy var locationStack : UIStackView =  {
            let stack = UIStackView(arrangedSubviews: [locationLabel, locationValueLabel])
            stack.axis = .horizontal
            stack.spacing = 8
            stack.distribution = .fill
            return stack
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init(coder: NSCoder) {
            fatalError()
        }
        
        private func setupViews(){
            addSubview(locationStack)
            locationStack.snp.makeConstraints {
                $0.leading.trailing.bottom.equalTo(self)
                $0.top.equalTo(self).offset(20)
            }
        }
        
        func setValue(_ value: String){
            locationValueLabel.text = value
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews(){
        axis = .vertical
        distribution = .fill
        spacing = 5
        _ = [nameStatusStack, speciesGenderStack, locationView].map {addArrangedSubview($0)}
        observerOnInfo()
    }
    
    private func observerOnInfo(){
        info.compactMap{$0}
        .sink {[weak self] info in
            self?.nameLabel.text = info.name
            self?.genderLabel.text = info.gender
            self?.speciesLabel.text = info.species
            self?.statusLabel.text = info.status.text
            self?.locationView.setValue(info.location)
        }.store(in: &cancellables)
    }
}
