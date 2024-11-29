//
//  StyleViewData.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

class StyleViewData{
    let background: UIColor
    let hasBorder: Bool
    
    init(background: UIColor, hasBorder: Bool = false) {
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
