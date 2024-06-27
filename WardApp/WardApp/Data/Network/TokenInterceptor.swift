//
//  TokenInterceptor.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Alamofire

final class TokenInterceptor: RequestInterceptor {
    
    private let authRepository = AuthRepository()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let accessToken = UserRepository.shared.getAccessToken()
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        let refreshToken = UserRepository.shared.getRefreshToken()
        
        authRepository.refreshToken(refreshToken: refreshToken)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            } receiveValue: { tokens in
                if let tokens {
                    UserRepository.shared.updateAcceesToken(tokens.accessToken)
                    UserRepository.shared.updateRefreshToken(tokens.refreshToken)
                    completion(.retry)
                } else {
                    completion(.doNotRetry)
                }
            }
            .cancel()
    }
}
