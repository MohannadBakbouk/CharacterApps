//
//  StyleViewData.swift
//  MixedUICharacterApp
//
//  Created by Mohannad on 27/11/2024.
//

import Foundation
import SwiftUI

class StyleViewData{
    let background: Color
    let hasBorder: Bool
    
    init(background: Color, hasBorder: Bool = false) {
        self.background = background
        self.hasBorder = hasBorder
    }
}

extension StyleViewData{
   convenience init(status: Status){
        switch status{
            case .alive:
                self.init(background: .alive)
            case .dead:
                self.init(background: .dead)
            case .unknown:
                self.init(background: .clear, hasBorder: true)
        }
    }
}
