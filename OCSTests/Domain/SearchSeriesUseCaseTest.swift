    //
    //  SearchSeriesUseCaseTest.swift
    //  OCSTests
    //
    //  Created by Zakaria on 9/12/2021.
    //

import XCTest
import Combine
@testable import OCS

class SearchSeriesUseCaseTest: XCTestCase {
    
    var cancellable = CancelBag()
    
    static let seriesArray = [Serie.stub(),
                              Serie.stub(),
                              Serie.stub(),
                              Serie.stub()]
    
    override func setUpWithError() throws {
            // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
        /// test FetchSeriesUseCase with success
    func testSearchSeriesUseCase_whenSuccessfullyFetchesSeries() {
            // given
        let repository = MockSearchSeriesRepository(mockedDataSource: SuccessMockedSeriesDataSource())
            // sut
        let useCase = OCSSearchSeriesUseCase(repository: repository)
        
        let expectation = self.expectation(description: "Fetching Series with Success")
        
        let stateHandler: StateHandler = { (result) in
            switch result {
                case .finished:
                    expectation.fulfill()
                case .failure(_):
                    break
            }
        }
            // When start fetch
        DispatchQueue.main.asyncAfter(deadline: (.now() + 1)) {
            useCase.getSeriesByName(name: "some name").sink(receiveCompletion: stateHandler, receiveValue: { (_, _) in }).store(in: &self.cancellable)
        }
            // Wait for the expectation to be fullfilled, or time out
            // after 2 seconds. This is where the test runner will pause.
            // then
        waitForExpectations(timeout: 2, handler: nil)
        
    }
        /// test FetchSeriesUseCase with Error
    func testFetchSeriesUseCase_whenFailedFetchingSeries() {
            // given
        let repository = MockSearchSeriesRepository(mockedDataSource: FailureMockedSeriesDataSource())
            // sut
        let useCase = OCSSearchSeriesUseCase(repository: repository)
        
        let expectation = self.expectation(description: "Fetching Series with Error")
        
        let stateHandler: StateHandler = { (result) in
            switch result {
                case .finished:
                    break
                case .failure(let error):
                    XCTAssertEqual((error as! OCSError).code, ErrorCodeType.generalError.rawValue)
                    expectation.fulfill()
            }
        }
            // When start fetch
        DispatchQueue.main.asyncAfter(deadline: (.now() + 1)) { [self] in
            useCase.getSeriesByName(name: "some name").sink(receiveCompletion: stateHandler, receiveValue: { (_, _) in }).store(in: &cancellable)
        }
            // Wait for the expectation to be fullfilled, or time out
            // after 2 seconds. This is where the test runner will pause.
            //        then
        waitForExpectations(timeout: 2, handler: nil)
        
    }
    
}
