//
//  MockCharacterServiceTests.swift
//  MixedUICharacterAppTests
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation
import XCTest
import Combine
@testable import MixedUICharacterApp

final class MockCharacterServiceTests: XCTestCase {
    var service: CharacterServiceProtocol!
    var cancellables = Set<AnyCancellable>()
    var timeout: TimeInterval = 5
    
    override func setUpWithError() throws {
        service = MockCharacterService()
        cancellables = []
    }

    override func tearDownWithError() throws {
       service = nil
       cancellables.removeAll()
    }

    func testfetchCharachters() throws {
        let expectation = expectation(description: "feteching Charachters from mocked api")
        var results : [Character] = []
        
        service.fetchCharacter(page: 1, status: nil)
        .sink {completed in
            expectation.fulfill()
        } receiveValue: { value in
            results.append(contentsOf: value.results)
        }.store(in: &cancellables)
        
        _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
        XCTAssert(results.count > 0  , "Failed to fetch Charachters from mocked api")
    }
}
