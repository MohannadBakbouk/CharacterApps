//
//  CharacterListViewModelTests.swift
//  MixedUICharacterAppTests
//
//  Created by Mohannad on 28/11/2024.
//

import XCTest
import SwiftUI
import Combine
@testable import MixedUICharacterApp

final class CharacterListViewModelTests: XCTestCase {
    var viewModel: CharacterListViewModel!
    var cancellables = Set<AnyCancellable>()
    var timeout: TimeInterval = 3
    
    override func setUpWithError() throws {
        viewModel = CharacterListViewModel(service: MockCharacterService())
        cancellables = []
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables.removeAll()
    }

    func testAreCharachtersPublished() throws {
        var results: [CharacterViewData] = []
        let expectation = expectation(description: "expectation for Charachters")
        
        viewModel.$characters
        .sink {completed in
            expectation.fulfill()
        } receiveValue: { value in
            results.append(contentsOf: value)
        }.store(in: &cancellables)
        
        viewModel.onAppear() // trigger the loadCharacters
        
        _ = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertGreaterThan(results.count, 0)
    }
    
    func testIsStatePublished() throws {
        let expectation = expectation(description: "Testing the state of viewModel")
        var received: [ViewModelState] = []
        let expected: [ViewModelState] = [.idle, .loading,.successful]
       
        viewModel.$state.sink { completed in
            expectation.fulfill()
        } receiveValue: { value in
            received.append(value)
        }.store(in: &cancellables)
        
        viewModel.onAppear()
        
        _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
        XCTAssert(received == expected, "Failed to publish state signal")
    }
    
    func testIsLoadinfMore() throws {
        var results: [CharacterViewData] = []
    
        viewModel.$characters
        .sink {_ in}
        receiveValue: { value in
            results = value
        }.store(in: &cancellables)
        
        viewModel.onAppear()
        _ = XCTWaiter().wait(for: [self.expectation(description: "wait load first page")], timeout: timeout)
        
        viewModel.loadNextPage() // trigger to load the next page
        _ = XCTWaiter().wait(for: [self.expectation(description: "wait load second page")], timeout: timeout)
        XCTAssert(results.count == 40)
    }
    
    func testStatusFilteringFetchesCorrectCharacters() throws {
        var results: [CharacterViewData] = []
        let expectation = expectation(description: "testing status filtering is fetcheing correct characters")
        
        viewModel.$characters
        .dropFirst()
        .sink {completed in
            expectation.fulfill()
        } receiveValue: { value in
            results.append(contentsOf: value)
        }.store(in: &cancellables)
        
        viewModel.selectedStatus = .dead // trigger the loadCharacters
        
        _ = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssert(results.count == 5)  // when the status is being passed , prompting the mocked api to load a DeadCharactersResponse file , which contains only 5 results
    }

}
