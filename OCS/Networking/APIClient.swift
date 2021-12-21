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
    class func imagesBaseURL() -> String {
        return self.serverParameters().imagesBaseURL
    }
    
    fileprivate class func serverParameters() -> ServerParameters {
#if os(iOS)
        #if DEV
        return ServerParameters.devParameters
        #elseif STAGE
        return ServerParameters.stagingParameters
        #elseif MOCK
        return ServerParameters.mockParameters
        #else
        fatalError("The environment is not specified")
        #endif
#else
        return ServerParameters.devParameters
#endif

    }
    
}
