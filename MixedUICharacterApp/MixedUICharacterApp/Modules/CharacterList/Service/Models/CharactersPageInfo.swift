//
//  CharactersPageInfo.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation

struct CharactersPageInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
