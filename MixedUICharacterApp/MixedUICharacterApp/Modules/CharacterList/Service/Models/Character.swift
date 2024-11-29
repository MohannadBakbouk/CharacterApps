//
//  Character.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
