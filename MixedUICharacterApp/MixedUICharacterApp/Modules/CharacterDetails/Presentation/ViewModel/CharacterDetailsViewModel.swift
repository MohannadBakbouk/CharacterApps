//
//  CharacterDetailsViewModel.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import Combine

final class CharacterDetailsViewModel: BaseViewModel{
    
    @Published var character: CharacterViewData
    
    init(info: CharacterViewData) {
        self.character = info
    }
}
