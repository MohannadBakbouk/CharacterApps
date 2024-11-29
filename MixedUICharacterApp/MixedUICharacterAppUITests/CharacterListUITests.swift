//
//  CharacterListUITests.swift
//  MixedUICharacterAppUITests
//
//  Created by Mohannad on 28/11/2024.
//

import Foundation
import XCTest
import Swifter


private let collectionViewName = "CharacterCollection"

final class CharacterListUITests: SuperXCTestCase {
    
    var errorMessage: String!
    var baseTimeout: TimeInterval = 5
    
    override func setUpWithError() throws {
        app.launchArguments = ["-uitesting"]
        errorMessage = "an internal error occured in server side please try again later"
        initNormalServer()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        errorMessage = nil
        server.stop()
        app.terminate()
    }
    
    func testIsTitleShown(){
        XCTAssert(app.staticTexts["Characters"].waitForExistence(timeout: baseTimeout))
    }
    
    func testIsStatusFilterShown(){
        XCTAssert(app.scrollViews["StatusView"].waitForExistence(timeout: baseTimeout))
    }
    
    func testAreAllFiltersShown(){
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for CharacterListView to appear")], timeout: baseTimeout)
        XCTContext.runActivity(named: "All status filters are displayed") { _ in
            XCTAssert(app.buttons["Alive"].exists)
            XCTAssert(app.buttons["Dead"].exists)
            XCTAssert(app.buttons["Unknown"].exists)
        }
    }
    
    func testAreCharactersCellsShown() throws {
        XCTAssert(app.collectionViews[collectionViewName].waitForExistence(timeout: baseTimeout))
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for CharacterListView items to appear")], timeout: baseTimeout)
        XCTAssert(app.collectionViews[collectionViewName].cells.count > 0)
    }
    
    func testAreCharacterInfoShown(){
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for CharacterListView items to appear")], timeout: baseTimeout * 2)
        let cell = app.collectionViews[collectionViewName].cells.firstMatch
        XCTContext.runActivity(named: "All charcter info are displayed") { _ in
            let nameText = cell.staticTexts.matching(NSPredicate(format: "label == %@", "Rick Sanchez")).firstMatch
            let speciesText = cell.staticTexts.matching(NSPredicate(format: "label == %@", "Human")).firstMatch
            XCTAssert(nameText.exists)
            XCTAssert(speciesText.exists)
        }
    }
    
    func testIsSelectingCharacterPushDetailsView(){
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for CharacterListView to appear")], timeout: baseTimeout)
        app.collectionViews[collectionViewName].cells.firstMatch.tap() //trigger select first character
        XCTAssert(app.buttons["BackButton"].exists)
    }
    
    func testIsErrorToastShown() throws {
        switchToFailureServer()
        let message = app.staticTexts[errorMessage]
        let isExists = message.waitForExistence(timeout: baseTimeout)
        XCTAssert(isExists)
    }
    
    func testWilErrorToastBeHidden() throws {
        switchToFailureServer()
        let message = app.staticTexts[errorMessage]
        _ = message.waitForExistence(timeout: baseTimeout)
        XCTAssertTrue(message.exists)
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting for the toast to disappear")], timeout: baseTimeout)
        XCTAssertFalse(message.exists, "toast message did not disapear")
    }
    
    func testIsSwipeUpInCollectionViewWorking() throws {
        let collectionView = app.collectionViews[collectionViewName]
        _ = collectionView.waitForExistence(timeout: baseTimeout * 2)
        let cell1 = collectionView.cells.element(boundBy: 0)
        let characterName1 = cell1.staticTexts.firstMatch.label
        collectionView.swipeUp()
        let cell2 = collectionView.cells.element(boundBy: 0)
        let characterName2 = cell2.staticTexts.firstMatch.label
        XCTAssert(characterName1 != characterName2)
    }
}
