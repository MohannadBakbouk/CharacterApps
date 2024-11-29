//
//  UISplashController.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit
import SnapKit

final class UISplashController: UIViewController {
    
    weak var coordinator : MainCoordinator?
    
    private var inidicatorView:  UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .title
        activityIndicator.style = .large
        activityIndicator.accessibilityIdentifier = "InidicatorView"
        return activityIndicator
    }()
    
    private var slugLabel : UILabel = {
        let label = UILabel()
        label.text = "UIKit Character App"
        label.textColor = .title
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.accessibilityIdentifier = "SlugLabel"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        routeToNextScreen()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubviews(contentOf: [slugLabel , inidicatorView])
        setupConstrains()
    }
    
    private func setupConstrains(){
        slugLabel.snp.makeConstraints { maker in
            maker.centerX.equalTo(view.snp.centerX)
            maker.centerY.equalTo(view.snp.centerY).offset(-50)
        }
        
        inidicatorView.snp.makeConstraints { maker in
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            maker.centerX.equalToSuperview()
        }
    }
    
    private func routeToNextScreen()  {
        inidicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[weak self]  in
            self?.coordinator?.showCharachterList()
        }
    }
}
