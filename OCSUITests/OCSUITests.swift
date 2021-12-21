//
//  OCSUITests.swift
//  OCSUITests
//
//  Created by Zakaria on 12/12/2021.
//

import XCTest

class OCSUITests: XCTestCase {

    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.

            // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

            // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchForSerieInFr() throws {
            // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

            // Use recording to get started writing UI tests.

        let filmSerieMagazineSearchField = app.searchFields["film, serie, magazine..."]
        filmSerieMagazineSearchField.tap()
            // unter a serie name
        filmSerieMagazineSearchField.typeText("under")
        
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"rechercher\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            // tap on the second element found
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        _ = app.scrollViews.otherElements.buttons["ic play button"].waitForExistence(timeout: 10)
        app.scrollViews.otherElements.buttons["ic play button"].tap()
            // play video
        let playPauseButton = app/*@START_MENU_TOKEN@*/.buttons["Play/Pause"]/*[[".buttons[\"Pause\"]",".buttons[\"Play\/Pause\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        playPauseButton.tap()

            //        filmSerieMagazineSearchField.typeText("under")

            // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
                // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
