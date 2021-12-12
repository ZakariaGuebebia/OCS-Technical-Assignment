//
//  DetailsRepository.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Combine

protocol DetailsRepository {
    
    func showDetails(detailLink: String) -> Future<((DetailsDTO, Details)), Error>
}
