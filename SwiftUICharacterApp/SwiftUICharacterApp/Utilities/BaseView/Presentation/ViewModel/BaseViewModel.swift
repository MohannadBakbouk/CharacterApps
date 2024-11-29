//
//  BaseViewModel.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var cancellables: Set<AnyCancellable>
    
    @Published var state: ViewModelState = .idle
    @Published var alertItem: AlertItem?
    @Published var toastItem: ToastItem?
    
    init() {
        self.cancellables = Set<AnyCancellable>()
    }
    
    deinit {
        self.cancellables.removeAll()
    }
}

