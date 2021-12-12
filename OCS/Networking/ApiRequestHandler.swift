//
    //  ApiRequestHandler.swift
    //  OCS
    //
    //  Created by Zakaria on 12/12/2021.
    //

    import Foundation
    import Combine
    import Alamofire

    class ApiRequestHandler: NSObject {

        // MARK: - Local Data
        class func loadLocalData<T: Codable, T1>(endPoint: EndPointType, decoder: JSONDecoder) -> Future<((T, T1)), Error> {
            return loadJson(fileName: endPoint.mockFileName ?? "", decoder: decoder)
        }

        class func loadJson<T: Codable, T1>(fileName: String, decoder: JSONDecoder) -> Future<((T, T1)), Error> {

            return Future { promise in

            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {

                    do {

                        let data = try Data(contentsOf: url)

                        let genericItem =  try decoder.decode(OCSResult<T>.self, from: data)

                        if let result = genericItem.contents {
                            promise(.success(convertToDomain(object: result)))
                        } else {
                            promise(.failure(OCSError.init(message: "decoding error", code: -1)))
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        promise(.failure(OCSError.init(message: error.localizedDescription, code: 0)))
                    }
                }

            }
        }
        class func request<T: Codable, T1>(endPointType: EndPointType) -> Future<((T, T1)), Error> {

                #if MOCK
            return loadLocalData(endPoint: endPointType, decoder: JSONDecoder())
                #else
                return Future {  promise in

                    AF.request(endPointType).validate().responseJSON(completionHandler: { response in

                        do {

                            let result: Result<T, Error>  = JSONDecoder().decodeResponse(from: response)

                            switch result {

                            case .success(let result):
                                promise(.success(convertToDomain(object: result)))

                            case .failure(let error):
                                promise(.failure(error))
                            }
                        }
                    })
                }
                #endif
            }

        class func convertToDomain<T: Codable, T1>(object: T) -> (T, T1) {

            if let arr = (object.self as? [DataModel]) {

                var arrayConverted: [DomainModel] = []

                arr.forEach { (element) in
                    if let converted = (element.toDomain()) {
                        arrayConverted.append(converted)
                    }
                }
                return (object, arrayConverted as! T1)
            } else {
                if object.dictionary != nil {
                    let dataModel = (object.self as! DataModel)
                    let domainModel = dataModel.toDomain()
                    return (object, domainModel as! T1)
                } else {
                    return (object, object as! T1)
                }
            }
        }
    }

    extension ApiRequestHandler {
        // MARK: - No internet Connection Method
        class func isInternetAvailable() -> Bool {
            guard let networkReachabilityManager = NetworkReachabilityManager() else {
                return true
            }
            return networkReachabilityManager.isReachable
        }
    }

    extension DataResponse {

        func description() {

            #if !DEBUG
            return
            #else
            print("Response:\n", self )
            #endif
        }
    }
