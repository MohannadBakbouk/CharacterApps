//
//  CharacterViewData.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import CommonShared

struct CharacterViewData: Hashable{
    let id: Int
    let name: String
    let imageUrl: URL?
    let status: StatusViewData
    let release: String
    let gender: String
    let episodesCount: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CharacterViewData{
    init (info: Character){
        self.id = info.id
        self.name = info.name
        self.imageUrl = URL(string: info.image)
        self.status = StatusViewData(status: info.status) ?? .unknown
        self.gender = info.gender.rawValue
        self.release = info.created.toDate?.year.description ?? "2024"
        self.episodesCount = info.episode.count.description
    }
}
