//
//  CharacterDetailsViewModel.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import Combine

final class CharacterDetailsViewModel: BaseViewModel{
    
    @Published var character: CharacterViewData
    
    init(info: CharacterViewData) {
        self.character = info
    }
    
    func makeTinyInfoViewData(item: TinyInfoType) -> TinyInfoViewData{
        switch item {
            case .status:
                TinyInfoViewData(for: item, value: character.status.text)
            case .gender:
                TinyInfoViewData(for: item, value: character.gender)
            case .release:
                TinyInfoViewData(for: item, value: character.release)
            case .episodes:
                TinyInfoViewData(for: item, value: character.episodesCount)
        }
    }
}
