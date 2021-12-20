//
//  DetailsEndPoint.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Alamofire

enum DetailsEndPoint: EndPointType {

    case details(detailLink: String)

    var method: HTTPMethod {

        switch self {
        case .details:
            return .get
        }
    }

    var path: String {
        var path = ""
        switch self {
            case .details(let detailLink):
            path = detailLink
            break
        }
        return path
    }

    // MARK: - Parameters
    var parameters: Any? {
        switch self {
        case .details:
            return nil
        }
    }

    var mockFileName: String? {
        return "Details"
    }

}
