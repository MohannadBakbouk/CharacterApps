//
//  UICharacterListController.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

final class UICharacterListController: UIBaseViewController<CharacterListViewModel> {
    let padding : CGFloat = 12
    
    lazy var collectionView : UICollectionView = {
        let collection = UICollectionView(frame: .zero , collectionViewLayout: collectionViewLayout)
        collection.allowsMultipleSelection = false
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.accessibilityIdentifier = "CharactersCollectionView"
        return collection
    }()
    
    lazy var collectionViewLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    lazy var titleFiltersStack : UIStackView = {
      let stack = UIStackView(arrangedSubviews: [titleLabel, filtersView])
      stack.spacing = 20
      stack.axis = .vertical
      stack.alignment = .fill
      stack.distribution = .fill
      return stack
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = UIColor(.title)
        return label
    }()
    
    lazy var filtersView: UIFiltersView = {
        let view = UIFiltersView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindingViewsToViewModelEvents()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard viewModel.characters.value.count == 0 else {return}
        viewModel.loadCharacters()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(titleFiltersStack)
        setupCollection()
        setupViewsConstraints()
        setupCollectionCellSize()
    }
    
    private func setupCollection(){
        collectionView.register(UICharacterCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setupLoadingIndicator()
    }
    
    private func setupCollectionCellSize(){
        let width = (UIScreen.main.bounds.width)
        let hieght = (UIScreen.main.bounds.height) / 5
        collectionViewLayout.itemSize = CGSize(width: width , height: hieght)
    }
    
    private func setupViewsConstraints(){
        
        titleFiltersStack.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleFiltersStack.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.bottom.equalToSuperview()
        }
        
        filtersView.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    private func bindingViewsToViewModelEvents(){
        bindingCharactersToCollectionView()
        bindingIsLoadingToAnimator()
        bindingSelectFilter()
        bindingError()
    }
}

extension UICharacterListController:UICollectionViewDataSource,  UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(with: UICharacterCell.self, for: indexPath) as? UICharacterCell ,
              let model = viewModel.characters.value[safe:indexPath.row] else {return UICollectionViewCell()}
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row == (viewModel.characters.value.count - 1) ,!viewModel.isLoadingMore.value else {return}
        viewModel.reachedBottomTrigger.send()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selected = viewModel.characters.value[safe:indexPath.row] else {return}
        (coordinator as? MainCoordinator)?.pushCharacterDetails(with: selected)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width )
        let hieght = (collectionView.frame.height) / 5
        return CGSize(width: width , height: hieght)
    }
}
