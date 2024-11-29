//
//  Coordinator.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var  childCoordinators : [Coordinator] {get set}
    var  navigationController : UINavigationController {get set}
    func start()
    func back()
    func dismiss()
}
