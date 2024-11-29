//
//  CharactersResponse.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation

struct CharactersResponse: Codable {
    let info: CharactersPageInfo
    let results: [Character]
}
