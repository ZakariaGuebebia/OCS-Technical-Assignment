//
    //  OCSResult.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import Foundation

class OCSResult<T: Codable>: Codable {
    let template: String?
    let parentalrating: Int?
    let title: String?
    let offset: Int?
    let limit, next, previous: String?
    let total, count: Int?
    let filter, sort: String?
    let contents: T?
}
