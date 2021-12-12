//
//  SearchSeriesRepository.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Combine

    /// SearchSeriesRepository protocol
protocol SearchSeriesRepository {
        /// search for serie or program by it's name
        /// - Returns: Void
    func getSeriesByName(name: String) -> Future<(([SerieDTO], [Serie])), Error>
}
