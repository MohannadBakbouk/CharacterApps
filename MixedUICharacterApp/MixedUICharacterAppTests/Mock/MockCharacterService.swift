//
//  MockCharacterService.swift
//  MixedUICharacterAppTests
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation
import Combine
import CommonShared
@testable import MixedUICharacterApp

final class MockCharacterService: CharacterServiceProtocol{
    func fetchCharacter(page: Int, status: String?) -> AnyPublisher<CharactersResponse, NetworkError> {
        let current = Bundle(for: type(of: self))
        let fileName = status == nil ? "CharactersResponse\(page)" : "\(status!.capitalized)CharactersResponse"
        let data = try? Data(contentsOf: current.url(forResource: fileName, withExtension: "json")!)
        let response = try! JSONDecoder().decode(CharactersResponse.self, from: data!)
        let stream : AnyPublisher<CharactersResponse, NetworkError> = Result.Publisher(response).eraseToAnyPublisher()
        return stream
    }
}

extension MockCharacterService{
    static func fetchOneFormattedCharachter() -> CharacterViewData{
        let current = Bundle(for: MockCharacterService.self)
        let data = try? Data(contentsOf: current.url(forResource: "CharactersResponse1", withExtension: "json")!)
        let response = try! JSONDecoder().decode(CharactersResponse.self, from: data!)
        return CharacterViewData(info: response.results.first!)
    }
}
