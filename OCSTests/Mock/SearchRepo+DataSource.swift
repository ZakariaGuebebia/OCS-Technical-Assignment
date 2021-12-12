//
//  SearchRepo+DataSource.swift
//  OCSTests
//
//  Created by Zakaria on 1112/12/2021.
//

import Foundation
import Combine
@testable import OCS

class MockSearchSeriesRepository: SearchSeriesRepository {

    private let mockedDataSource: SearchSeriesDataSource

    internal init(mockedDataSource: SearchSeriesDataSource) {
        self.mockedDataSource = mockedDataSource
    }
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
        mockedDataSource.getSeriesByName(name: name)
    }

}

class SuccessMockedSeriesDataSource: SearchSeriesDataSource {
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
        return Future { promise in promise(.success((([], SearchSeriesUseCaseTest.seriesArray))))}
    }
}

class FailureMockedSeriesDataSource: SearchSeriesDataSource {
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
        return  Future { promise in promise(.failure(OCSError(message: "generalError", code: ErrorCodeType.generalError.rawValue)))}
    }
}
