//
//  NewTestSample_UI_Tests.swift
//  NewTestSample UI Tests
//
//  Created by Pivotal on 6/18/15.
//  Copyright © 2015 Pivotal. All rights reserved.
//

import UIKit
import XCTest
import OHHTTPStubs

class NewTestSample_UI_Tests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.buttons["Earthquakes"].tap()
        
        XCTAssertEqual(app.tables.elementAtIndex(0).cells.count, 10)
        
        app.tables.elementAtIndex(0).cells.elementAtIndex(0).tap()
        
        XCTAssertTrue(app.staticTexts["c0001xgp"].exists)
        XCTAssertTrue(app.staticTexts["8.8"].exists)
        XCTAssertTrue(app.staticTexts["24.40m"].exists)
        
        app.navigationBars["EarthquakeDetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0).tap()
        app.navigationBars["EarthquakesTableView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0).tap()
        
        XCTAssertTrue(app.staticTexts["Hello world!"].exists)
    }
    
}
