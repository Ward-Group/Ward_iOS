//
//  AuthRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation
import Combine

enum AuthError: Error {
    case needSignUp, invalidInput, unknown, emptyData
}

struct AuthRepository {
    
    func login(dto: LoginDto) -> AnyPublisher<LoginResponse, AuthError> {
        return NetworkingManager().run(AuthEndpoint.login(dto), type: WardBaseResponse<LoginResponse>.self)
            .tryMap { response -> LoginResponse in
                Log.debug(#file, response)
                let code = response.code
                switch code {
                case 200:
                    if let data = response.data {
                        return data
                    } else {
                        throw AuthError.emptyData
                    }
                case 5203, 5208:
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
