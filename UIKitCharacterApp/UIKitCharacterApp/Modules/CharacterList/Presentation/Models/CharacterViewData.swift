//
//  CharacterViewData.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import CommonShared

struct CharacterViewData{
    let id: Int
    let name: String
    let imageUrl: URL?
    let status: StatusViewData
    let style: StyleViewData
    let location: String
    let gender: String
    let species: String
}

extension CharacterViewData{
    init (info: Character){
        self.id = info.id
        self.name = info.name
        self.imageUrl = URL(string: info.image)
        self.status = StatusViewData(status: info.status) ?? .unknown
        self.style =  StyleViewData(status: info.status)
        self.gender = info.gender.rawValue
        self.location = info.location.name
        self.species = info.species
    }
}
