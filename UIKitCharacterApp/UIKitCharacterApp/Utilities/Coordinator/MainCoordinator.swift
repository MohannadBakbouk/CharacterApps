//
//  MainCoordinator.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigation : UINavigationController) {
        childCoordinators = []
        navigationController = navigation
    }
    
    func start() {
        let splash = UISplashController()
        splash.coordinator = self
        pushViewControllerToStack(with: splash)
    }
    
    func showCharachterList(){
        let viewModel = CharacterListViewModel(service: CharacterService())
        let CharachterListScreen = UICharacterListController(viewModel:viewModel, coordinator: self)
        pushViewControllerToStack(with:CharachterListScreen, animated: false, isRoot: true)
    }
    
    func pushCharacterDetails(with value: CharacterViewData){
        let viewModel = CharacterDetailsViewModel(character: value)
        let detailsScreen = UICharacterDetailsController(viewModel:viewModel, coordinator: self)
        pushViewControllerToStack(with:detailsScreen, animated: true, isRoot: false)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}

extension MainCoordinator {
    func pushViewControllerToStack(with value : UIViewController , animated : Bool = true ,  isRoot: Bool = false){
        _ = isRoot ? navigationController.setViewControllers([], animated: false) : ()
        navigationController.pushViewController(value, animated: animated)
    }
}
