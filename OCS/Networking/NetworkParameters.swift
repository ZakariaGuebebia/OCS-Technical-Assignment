//
//  NetworkParameters.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation

struct ServerParameters {
    
    let baseURL: String

    static let devParameters: ServerParameters = ServerParameters(
        baseURL: "https://api.ocs.fr")

    static let mockParameters: ServerParameters = ServerParameters(
        baseURL: "https://api.ocs.fr")

    static let stagingParameters: ServerParameters = ServerParameters(
        baseURL: "https://api.ocs.fr")
    
    static var headers: [String: String]?
    
}

struct EndPoints {
    static let contents = "/apps/v2/contents"
}
struct BodyParametersKey {
}

enum ContentType: String {
    case json = "application/json"
    case data = "multipart/form-data"
    case url =  "application/x-www-form-urlencoded"
}
enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case acceptLanguage = "Accept-Language"
    case deviceId = "Device-Id"
    case devicePlatform = "Device-Platform"
}
