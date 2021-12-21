//
//  UseCase.swift
//  OCSTests
//
//  Created by Zakaria on 1112/12/2021.
//

import Foundation
import Combine
import XCTest
@testable import OCS

enum SearchSeriesUseCaseType {
    case success
    case failure
}
class MockSearchSeriesUseCase: SearchSeriesUseCase {

    static let seriesArray = [Serie.stub(),
                              Serie.stub(),
                              Serie.stub(),
                              Serie.stub()]

    var successExpectation: XCTestExpectation?
    var failureExpectation: XCTestExpectation?

    var error: OCSError?
    var fetchSeriesUseCaseType: SearchSeriesUseCaseType?

    internal init(fetchSeriesUseCaseType: SearchSeriesUseCaseType) {
        self.fetchSeriesUseCaseType = fetchSeriesUseCaseType
    }

    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {

        let result: Future<(([SerieDTO], [Serie])), Error>

        switch self.fetchSeriesUseCaseType {
            case .success:
                successExpectation?.fulfill()
                result = Future { promise in promise(.success((([], MockSearchSeriesUseCase.seriesArray))))}
            case .failure:
                failureExpectation?.fulfill()
                result = Future { promise in promise(.failure(OCSError(message: "generalError", code: ErrorCodeType.generalError.rawValue)))}
            case .none:
                result = Future { promise in promise(.failure(OCSError(message: "generalError", code: ErrorCodeType.generalError.rawValue)))}
        }

        return result
    }
}
