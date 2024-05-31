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
}

class AlamofireNetworkingManager {
    
    static let shared = AlamofireNetworkingManager()
    private init() {}
    
    func run<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, APIError> {
        let headersArray = endpoint.headers.map {
            HTTPHeader(name: $0, value: $1)
        }
        
        let headers = HTTPHeaders(headersArray)
        
        return AF.request(endpoint.url,
                   method: endpoint.method,
                   parameters: endpoint.parameters,
                   encoding: endpoint.encoding,
                   headers: headers)
        .publishDecodable(type: T.self)
        .value()
        .mapError { error in
            print(error.localizedDescription)
            return APIError.networkingError(error: error)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func handleCompletion(completion: Subscribers.Completion<APIError>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
