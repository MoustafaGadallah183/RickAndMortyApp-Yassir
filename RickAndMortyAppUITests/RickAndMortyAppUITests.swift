//
//  RickAndMortyAppUITests.swift
//  RickAndMortyAppUITests
//
//  Created by Moustafa Mohamed Gadallah on 04/03/1447 AH.
//

// RickAndMortyAppUITests.swift
import XCTest
@testable import RickAndMortyApp

final class RickAndMortyAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCharactersListExists() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "Characters list should have at least one cell")
    }
    
    func testCharacterRowTapOpensDetail() {
        let firstCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5))
        firstCell.tap()
        
    }
    
    func testSearchBarFiltersResults() {
        let searchField = app.searchFields.element(boundBy: 0)
        XCTAssertTrue(searchField.waitForExistence(timeout: 5), "Search bar should exist")
        searchField.tap()
        searchField.typeText("Rick")
        sleep(2)
        let firstCellAfterSearch = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstCellAfterSearch.exists, "Search should display at least one result")
    }
}
