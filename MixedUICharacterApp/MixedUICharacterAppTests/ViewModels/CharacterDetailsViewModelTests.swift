//
//  CharacterDetailsViewModelTests.swift
//  MixedUICharacterAppTests
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation
import XCTest
import SwiftUI
import Combine
@testable import MixedUICharacterApp

final class CharacterDetailsViewModelTests: XCTestCase {
    var viewModel: CharacterDetailsViewModel!
    var cancellables = Set<AnyCancellable>()
    var timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        viewModel = CharacterDetailsViewModel(info: MockCharacterService.fetchOneFormattedCharachter())
        cancellables = []
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables.removeAll()
    }
    
    func testAreCharachterDetailsPublished() throws {
        var info: CharacterViewData!
        let expectation = expectation(description: "expectation for character details")
        
        viewModel.$character
        .sink {completed in
            expectation.fulfill()
        } receiveValue: { value in
            info = value
        }.store(in: &cancellables)
        
        _ = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertNotNil(info)
    }
}
