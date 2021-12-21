//
//  DetailsUseCase.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Combine

protocol DetailsUseCase {
    func fetchDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error>
}

class OCSDetailsUseCase: DetailsUseCase {

    private var repository: DetailsRepository
    
    internal init(repository: DetailsRepository) {
        self.repository = repository
    }
    
    func fetchDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error> {
        return repository.showDetails(detailLink: detailLink)
    }
}
