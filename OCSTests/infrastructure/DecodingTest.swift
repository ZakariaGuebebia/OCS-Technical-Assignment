//
//  DecodingTest.swift
//  OCSTests
//
//  Created by Zakaria on 20/12/2021.
//

import XCTest
import Combine
@testable import OCS

class DecodingTest: XCTestCase {

    var cancellable = CancelBag()

    func testData_integrity() {
            // given
        let repository = MockSearchSeriesRepository(mockedDataSource: LocalSeriesDataSource())
            // sut
        let useCase = OCSSearchSeriesUseCase(repository: repository)

        let expectation = self.expectation(description: "Fetching Series with Success")

        let receiveValue: ([SerieDTO], [Serie]) -> Void = { (_, series) in
            XCTAssert(series.isEmpty == false, "series array is empty")
            series.forEach {
                XCTAssertTrue($0.title != nil, "empty title")
                XCTAssertTrue($0.subtitle != nil, "empty subtitle")
                XCTAssertTrue($0.detaillink != nil, "empty detaillink")
                XCTAssertTrue($0.imageurl != nil, "empty imageurl")
                XCTAssertTrue($0.fullscreenimageurl != nil, "empty fullscreenimageurl")
            }
            expectation.fulfill()
        }
            // When start fetch
        useCase.getSeriesByName(name: "some name").sink(receiveCompletion: {_ in}, receiveValue: receiveValue).store(in: &self.cancellable)
            // Wait for the expectation to be fullfilled, or time out
            // after 2 seconds. This is where the test runner will pause.
            // then
        waitForExpectations(timeout: 2, handler: nil)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
