//
//  N2GoDetailsRepository.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Combine

class OCSDetailsRepository: DetailsRepository {
    
    private let remoteDataSource: DetailsDataSource
    
    internal init(remoteDataSource: DetailsDataSource = RemoteDetailsDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func showDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error> {
            return remoteDataSource.showDetails(detailLink: detailLink)
    }
}

// MARK: DataSource
protocol DetailsDataSource {
    func showDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error>
}

class RemoteDetailsDataSource: DetailsDataSource {
    
    func showDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error> {
        return ApiRequestHandler.request(endPointType: DetailsEndPoint.details(detailLink: detailLink))
    }
}
