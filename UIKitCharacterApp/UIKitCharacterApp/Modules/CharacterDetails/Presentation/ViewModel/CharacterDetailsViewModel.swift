//
//  CharacterDetailViewModel.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine


final class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol{
    var details: CurrentValueSubject<CharacterViewData?, Never>
    var cancellables: Set<AnyCancellable>
    var isLoading: PassthroughSubject<Bool, Never>
    var error: CurrentValueSubject<ErrorViewData?, Never>
    
    init(character: CharacterViewData) {
        self.cancellables = []
        self.isLoading = PassthroughSubject()
        self.error = CurrentValueSubject(nil)
        self.details = CurrentValueSubject(character)
    }
}
