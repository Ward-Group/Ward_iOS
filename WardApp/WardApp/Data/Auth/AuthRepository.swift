//
//  AuthRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation
import Combine

enum AuthError: Error {
    case needSignUp, invalidInput, unknown
}

struct AuthRepository {
    
    func login(dto: LoginDto) -> AnyPublisher<LoginResponse, AuthError> {
        return NetworkingManager().run(AuthEndpoint.login(dto), type: WardBaseResponse<LoginResponse>.self)
            .tryMap { response -> LoginResponse in
                let code = response.code
                switch code {
                case 200:
                    return response.data
                case 5208:
                    throw AuthError.needSignUp
                case 5000:
                    throw AuthError.invalidInput
                default:
                    throw AuthError.unknown
                }
            }
            .mapError { _ -> AuthError in
                return .unknown
            }
            .eraseToAnyPublisher()
    }
}
