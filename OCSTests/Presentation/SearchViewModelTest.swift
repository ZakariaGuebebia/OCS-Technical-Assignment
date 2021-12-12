//
//  SearchViewModelTest.swift
//  OCSTests
//
//  Created by Zakaria on 1112/12/2021.
//

import XCTest
import Combine
@testable import OCS

class SearchViewModelTest: XCTestCase {

    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessfully_searchSeries() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        let usecase = MockSearchSeriesUseCase(fetchSeriesUseCaseType: .success)
        usecase.successExpectation = expectation(description: "did search series successfully")
        let viewModel = OCSSearchSeriesViewModel(searchSeriesUseCase: usecase)

        viewModel.getSeriesByName(name: "some title")
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testFailuure_searchSeries() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        let usecase = MockSearchSeriesUseCase(fetchSeriesUseCaseType: .failure)
        usecase.failureExpectation = expectation(description: "error searching for serie")
        let viewModel = OCSSearchSeriesViewModel(searchSeriesUseCase: usecase)

        viewModel.getSeriesByName(name: "some title")
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testPerformanceExample() throws {
            // This is an example of a performance test case.
            //        self.measure {
            //            // Put the code you want to measure the time of here.
            //        }

    }

}
