//
//  StatusViewData.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation

enum StatusViewData: String, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

extension StatusViewData{
    init?(status: Status) {
        self.init(rawValue: status.rawValue.capitalized)
    }
    
    var text: String{
        self.rawValue
    }
}
