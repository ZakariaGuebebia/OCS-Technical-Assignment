//
//  SearchEndPoint.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Alamofire

enum SearchEndPoint: EndPointType {

    case searchSeriesByName(name: String)

    var method: HTTPMethod {

        switch self {
        case .searchSeriesByName:
            return .get
        }
    }

    var path: String {
        var path = ""
        switch self {
            case .searchSeriesByName(let name):
            path = "?search=title="+name
            break
        }
        return EndPoints.contents+path
    }

    // MARK: - Parameters
    var parameters: Any? {
        switch self {
        case .searchSeriesByName:
            return nil
        }
    }

    var mockFileName: String? {
        return "Search"
    }

}
