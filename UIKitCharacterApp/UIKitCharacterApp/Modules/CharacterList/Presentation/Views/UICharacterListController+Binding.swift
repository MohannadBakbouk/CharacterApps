//
//  UICharacterListController+M.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine

extension UICharacterListController {
    func bindingCharactersToCollectionView(){
        viewModel.characters
        .receive(on: DispatchQueue.main)
        .sink {[weak self] items in
            self?.collectionViewLayout.invalidateLayout()
            self?.collectionView.reloadData()
        }.store(in: &cancellables)
    }
    
    func bindingIsLoadingToAnimator(){
        viewModel.isLoading
        .receive(on: DispatchQueue.main)
        .sink {[weak self] status in
            self?.collectionView.toggleLoadingIndicator(status)
        }.store(in: &cancellables)
    }
    
    func bindingError(){
        viewModel.error
        .receive(on: DispatchQueue.main)
        .sink {[weak self] error in
            guard let error = error else {return}
            self?.collectionView.setMessage(error.message)
        }.store(in: &cancellables)
    }
    
    func bindingSelectFilter(){
        filtersView.onSelectedItem
        .sink {[weak self] value in
            self?.viewModel.selectedStatus = value
        }.store(in: &cancellables)
    }
}
