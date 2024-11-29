//
//  CharacterService.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 26/11/2024.
//

import Foundation
import Combine
import CommonShared

protocol CharacterServiceProtocol {
    func fetchCharacter(page: Int, status: String?) -> AnyPublisher<CharactersResponse, NetworkError>
}

final class CharacterService: CharacterServiceProtocol {
    let networkManager : NetworkManagerProtocol
    
    init(networkManager : NetworkManagerProtocol = NetworkManager(NetworkConfigurations())) {
        self.networkManager = networkManager
    }
    
    func fetchCharacter(page: Int, status: String?) -> AnyPublisher<CharactersResponse, NetworkError> {
        return networkManager.request(endpoint: CharacterEndpoint.fetchCharacters(page: page, status: status))
    }
    
}
