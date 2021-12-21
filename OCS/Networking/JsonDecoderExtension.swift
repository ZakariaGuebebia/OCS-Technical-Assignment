//
//  JsonDecoderExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import Alamofire
import Combine

extension JSONDecoder {
    
    func decodeResponse<T: Codable>(from responseData: DataResponse<Any, AFError>?) -> Result<T, Error> {
        
        responseData?.description()
        
        guard let dataResponse = responseData, dataResponse.error == nil, let data = dataResponse.data else {
            return  .failure(OCSError(code: ErrorCodeType.decodingError.rawValue))
        }
        
        return self.parseData(data: data)
    }
    
    func parseData<T: Codable>(data: Data) -> Result<T, Error> {
        do {

                let genericItem =  try self.decode(OCSResult<T>.self, from: data)
                if let result = genericItem.contents {
                    return .success(result)
                }
        } catch let error {
            print(error)
            return .failure(OCSError(code: ErrorCodeType.decodingError.rawValue))
        }
        return .failure(OCSError(code: ErrorCodeType.decodingError.rawValue))
    }
}
