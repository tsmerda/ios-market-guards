//
//  MarketGuardsUITests.swift
//  MarketGuardsUITests
//
//  Created by Tomáš Šmerda on 10.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import XCTest
import SwiftUI
@testable import MarketGuards

class MarketGuardsUITests: XCTestCase {
    
    override func setUpWithError() throws {
//        super.setUp()
//        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testExample() throws {
        // for test succeed add UserProfileView() to struct MarketGuardsApp
        
        let app = XCUIApplication()
        app.launch()

        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["Upravit profil"].tap()
        app.buttons["ZMĚNIT FOTKU"].tap()
        elementsQuery.buttons["man_blue"].tap()
        
        let choosenImage = app.images["man_blue"]
        XCTAssertTrue(choosenImage.label == "man_blue")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
