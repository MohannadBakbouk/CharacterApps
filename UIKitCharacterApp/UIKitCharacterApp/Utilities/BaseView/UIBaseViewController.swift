//
//  UIBaseViewController.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit
import Combine

class UIBaseViewController<VM: BaseViewModelProtocol>: UIViewController {
    var cancellables: Set<AnyCancellable>
    weak var coordinator: Coordinator?
    let viewModel: VM!
    
    init(viewModel: VM!, coordinator: Coordinator?) {
        self.cancellables = []
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
