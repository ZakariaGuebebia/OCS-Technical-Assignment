//
//  APIClient.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation

class ApiClient: NSObject {
    
    class func baseURL() -> String {
        return self.serverParameters().baseURL
    }
    
    fileprivate class func serverParameters() -> ServerParameters {
        
        #if DEV
        return ServerParameters.devParameters
        #elseif STAGE
        return ServerParameters.stagingParameters
        #elseif PROD
        return ServerParameters.prodParameters
        #elseif MOCK
        return ServerParameters.mockParameters
        #else
        fatalError("The environment is not specified")
        #endif
    }
    
}
