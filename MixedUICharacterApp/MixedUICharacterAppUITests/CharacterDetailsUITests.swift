//
//  CharacterDetailsUITests.swift
//  MixedUICharacterAppUITests
//
//  Created by Mohannad on 28/11/2024.
//

import XCTest

private let collectionViewName = "CharacterCollection"

final class CharacterDetailsUITests: SuperXCTestCase {
    var baseTimeout: TimeInterval = 5
    
    override func setUpWithError() throws {
        app.launchArguments = ["-uitesting"]
        initNormalServer()
        app.launch()
        navigateToDetailsView()
    }
    
    override func tearDownWithError() throws {
        server.stop()
        app.terminate()
    }
    
    func testIsBackButtonShown(){
        XCTAssert(app.buttons["BackButton"].exists)
    }
    
    func testIsCharacterImageShown(){
        XCTAssert(app.images["CharacterImage"].exists)
    }
    
    func testIsCharacterNameShown(){
        XCTAssert(app.staticTexts["CharacterName"].exists)
    }
    
    func testIsCharacterStatusShown(){
        XCTAssert(app.staticTexts["CharacterStatus"].exists)
    }
    
    func testIsCharacterGenderShown(){
        XCTAssert(app.staticTexts["CharacterGender"].exists)
    }
    
    func testIsCharacterSpeciesShown(){
        XCTAssert(app.staticTexts["CharacterSpecies"].exists)
    }
    
    func testIsCharacterLocationShown(){
        XCTAssert(app.staticTexts["CharacterLocation"].exists)
    }
    
    func testIsNavigationBackWorking(){
        let backButton = app.buttons["BackButton"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
        XCTAssertFalse(backButton.exists)
    }
}

extension CharacterDetailsUITests{
    func navigateToDetailsView(){
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for CharacterListView to appear")], timeout: baseTimeout * 2)
        app.collectionViews[collectionViewName].cells.firstMatch.tap()
    }
}
