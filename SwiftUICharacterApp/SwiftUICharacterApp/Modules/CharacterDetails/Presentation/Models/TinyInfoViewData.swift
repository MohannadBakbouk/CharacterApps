//
//  TinyInfoViewData.swift
//  SwiftUICharacterApp
//
//  Created by Mohannad on 29/11/2024.
//

import Foundation
import Foundation

struct TinyInfoViewData{
    let icon: String
    let value: String
}

extension TinyInfoViewData{
    init(for type: TinyInfoType, value: String){
        self.icon = type.icon
        self.value = value
    }
}
