//
//  View+Ex.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(contentOf items: [UIView]){
        _ = items.map{addSubview($0)}
    }
}

