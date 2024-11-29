//
//  UICharacterDetailsController.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class UICharacterDetailsController: UIBaseViewController<CharacterDetailsViewModel>{
    private var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    
    private var contentView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.accessibilityIdentifier = "CharacterImageView"
        return image
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Images.back, withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        button.tintColor = .title
        button.setImage(image, for: .normal)
        button.accessibilityIdentifier = "BackButton"
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var detailsView: UIDetailsView = {
        let detailsView = UIDetailsView()
        return detailsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(contentOf: [imageView, backButton, detailsView])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        setupViewsConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindingDetailsToViews()
        bindingDetailsImage()
    }
    
    private func setupViewsConstraints(){
        scrollView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{ maker in
            maker.top.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide)
            maker.width.equalTo(scrollView.frameLayoutGuide).priority(.required)
            maker.height.greaterThanOrEqualTo(scrollView.frameLayoutGuide).priority(.high)
            maker.height.equalTo(scrollView.frameLayoutGuide).priority(.low)
        }
        
        imageView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(contentView)
            $0.width.equalTo(contentView.snp.width)
            $0.height.equalTo(scrollView.snp.height).multipliedBy(0.5)
        }
        
        detailsView.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(22)
            $0.trailing.equalTo(contentView).offset(-22)
            $0.top.equalTo(imageView.snp.bottom).offset(25)
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(0)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            $0.size.equalTo(50)
        }
    }
    
    func bindingDetailsToViews(){
        viewModel.details
            .receive(on: DispatchQueue.main)
            .assign(to: \.value , on: detailsView.info)
            .store(in: &cancellables)
    }
    
    func bindingDetailsImage(){
        viewModel.details
            .receive(on: DispatchQueue.main)
            .sink {[weak self] info in
                guard let self = self else {return}
                self.imageView.kf.setImage(with: info?.imageUrl)
            }.store(in: &cancellables)
    }
    
    @objc func backButtonTapped(){
        coordinator?.back()
    }
}
