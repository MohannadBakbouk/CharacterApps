//
//  BaseViewModel.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine

protocol BaseViewModelProtocol  {
    var cancellables: Set<AnyCancellable> {get}
    var isLoading: PassthroughSubject<Bool, Never> { get }
    var error: CurrentValueSubject<ErrorViewData?, Never> {get}
}

class BaseViewModel: BaseViewModelProtocol{
    var cancellables: Set<AnyCancellable>
    var isLoading: PassthroughSubject<Bool, Never>
    var error: CurrentValueSubject<ErrorViewData?, Never>
    
    
    init() {
        self.cancellables = []
        self.isLoading = PassthroughSubject()
        self.error = CurrentValueSubject(nil)
    }
}
