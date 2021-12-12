//
//  OCSCountryRepository.swift
//  Number2Go
//
//  Created by Zakaria on 4/14/21.
//

import Foundation
import Combine

class OCSSearchSeriesRepository: SearchSeriesRepository {
    
    private let remoteDataSource: SearchSeriesDataSource
    
    internal init(remoteDataSource: SearchSeriesDataSource = RemoteSearchSeriesDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
            return remoteDataSource.getSeriesByName(name: name)
    }
}

// MARK: DataSource
protocol SearchSeriesDataSource {
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error>
}

class RemoteSearchSeriesDataSource: SearchSeriesDataSource {
    
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
        return ApiRequestHandler.request(endPointType: SearchEndPoint.searchSeriesByName(name: name))
    }
}
