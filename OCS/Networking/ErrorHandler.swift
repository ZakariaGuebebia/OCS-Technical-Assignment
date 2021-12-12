//
    //  ErrorHandler.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

import Foundation

struct OCSErrorModel: Codable {
    var error: String
}
public class OCSError: Codable, Error {
    
    internal init(message: String? = nil, code: Int? = 0) {
        
        self.message = message
        self.code = code
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case message = "error"
    }
        // MARK: Properties
    public var message: String?
    public var code: Int? = 0
    
}

enum HTTPSucsseCode: Int {
    case okCode = 200
    case createdCode = 201
    case partialInformationCode = 204
}

enum ErrorCodeType: Int {
    
    case generalError = 0
    case noInternetError = -2
    case tryAgainError = 100
    case dataNotAvailableError = 101
    case saveFailedError = 116
    case updateFailedError = 117
    case operationNotAllowedError = 104
    case operationUnsupportedError = 124
    case tryRefreshError = 110
    case tryLaterError = 111
    case tryNewInputError = 102
    case invalidInputError = 103
    case gatewayWrongError = 136
    case moiFailedError = 107
    case woqodeFailedError = 108
    case statusUnknownError = 135
    case genericError = 500
    case serverError = -1
    case decodingError = -101
    case unAuthorisedError = 401
    case validationError = 400
    case forbidden = 403
    case notFound = 404
    case invalidInput = 405
    
    init(fromRawValue: Int) {
        self = ErrorCodeType(rawValue: fromRawValue) ?? .serverError
    }
}
