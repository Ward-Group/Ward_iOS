//
//  NetworkingManager.swift
//  WardApp
//
//  Created by peppermint100 on 5/28/24.
//

import Combine
import Alamofire

enum APIError: Error {
    case networkingError(error: Error)
    case failToDecode
    case unknown
}

public enum MyNetworkError: Error {
    case networkError(error: Error)
}

class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() {}
    
    func run<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, APIError> {
        let headersArray = endpoint.headers.map {
            HTTPHeader(name: $0, value: $1)
        }
        let headers = HTTPHeaders(headersArray)
        
        return Future<T, APIError> { promise in
            AF.request(endpoint.url,
                       method: endpoint.method,
                       parameters: endpoint.parameters,
                       encoding: endpoint.encoding,
                       headers: headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    promise(.success(value))
                case .failure(let error):
                    Log.error(#file, #function, error)
                    promise(.failure(.networkingError(error: error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
