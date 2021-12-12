//
//  OCSSearchSeriesUseCase.swift
//  Number2Go
//
//  Created by Zakaria on 4/20/21.
//

import Foundation
import Combine

protocol SearchSeriesUseCase {
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error>
}

class OCSSearchSeriesUseCase: SearchSeriesUseCase {

    private var repository: SearchSeriesRepository

    internal init(repository: SearchSeriesRepository) {
        self.repository = repository
    }

    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error> {
        return repository.getSeriesByName(name: name)
    }
}
