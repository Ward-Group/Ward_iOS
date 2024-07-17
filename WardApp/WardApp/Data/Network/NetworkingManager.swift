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
    case invalidStatusCode
}

public enum MyNetworkError: Error {
    case networkError(error: Error)
}

class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() {}
    
    func run<T: Decodable>(_ endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, APIError> {
        
        return Future<T, APIError> { promise in
            AF.request(endpoint.url,
                       method: endpoint.method,
                       parameters: endpoint.parameters,
                       encoding: endpoint.encoding,
                       headers: endpoint.headers,
                       interceptor: TokenInterceptor()
            )
            .responseData { response in
                let request = response.request
                let urlStr = request?.url?.absoluteString ?? "nil"
                let method = request?.httpMethod ?? "nil"
                let statusCode = response.response?.statusCode ?? -99
                var bodyString = "nil"
                if let data = request?.httpBody,
                   let string = String(bytes: data, encoding: .utf8) {
                    bodyString = string
                }
                var responseString = "nil"
                let data = response.data
                if let responseStr = data?.toPrettyPrintedString {
                    responseString = responseStr
                }
                let message: String = """
                📡 HTTP RESPONSE (\(Date().debugDescription))📡
                method : \(method)
                statusCode: \(statusCode)
                url: \(urlStr)
                body: \(bodyString)
                response: \(responseString)
                --------------------------------
                """
                Log.network(message)
                
                switch response.result {
                case .success(let data):
                    if let statusCode = response.response?.statusCode {
                        do {
                            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                            promise(.success(decodedResponse))
                        } catch {
                            promise(.failure(APIError.failToDecode))
                        }
                    } else {
                        promise(.failure(APIError.invalidStatusCode))
                    }
                case .failure(let error):
                    promise(.failure(APIError.networkingError(error: error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
