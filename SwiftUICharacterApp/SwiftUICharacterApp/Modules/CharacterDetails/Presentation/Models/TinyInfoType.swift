//
//  TinyInfoType.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation

enum TinyInfoType: CaseIterable{
    case status
    case gender
    case release
    case episodes
}

extension TinyInfoType{
    var icon: String{
        switch self {
            case .status:
                return "person.circle"
            case .gender:
                return "tag.circle.fill"
            case .release:
                return "calendar.circle.fill"
            case .episodes:
                return "camera.circle"
        }
    }
}
