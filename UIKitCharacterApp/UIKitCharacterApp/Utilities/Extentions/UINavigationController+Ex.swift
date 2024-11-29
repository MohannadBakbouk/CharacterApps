//
//  UINavigationController+Ex.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

extension UINavigationController{
    convenience init(hideBar : Bool){
        self.init()
        navigationBar.isHidden = hideBar
    }
}
