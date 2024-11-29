//
//  StatusViewData.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import SwiftUI

enum StatusViewData: String, Codable, CaseIterable {
    case all = "All Status"
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
    
    var color: Color{
        switch self {
            case .all:     .clear
            case .alive:   .green
            case .dead:    .red
            case .unknown: .gray
        }
    }
}
