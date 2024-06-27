//
//  AuthRepository.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation
import Combine

enum AuthError: Error {
    case needSignUp, invalidInput, unknown, emptyData, userAlreadyExists, duplicatedNickname, invalidRefreshToken, failToLogOut
}

struct AuthRepository {
    
    func login(dto: LoginDto) -> AnyPublisher<AuthResponse, AuthError> {
        return NetworkingManager.shared.run(AuthEndpoint.login(dto), type: WardBaseResponse<AuthResponse>.self)
            .tryMap { response -> AuthResponse in
                Log.debug(#file, #function, response)
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
            .mapError(mapError)
            .eraseToAnyPublisher()
    }
    
    func signUp(dto: SignUpDto) -> AnyPublisher<AuthResponse, AuthError> {
        return NetworkingManager.shared.run(AuthEndpoint.signUp(dto), type: WardBaseResponse<AuthResponse>.self)
            .tryMap { response in
                Log.debug(#file, #function, response)
                let code = response.code
                switch code {
                case 200:
                    if let data = response.data {
                        return data
                    } else {
                        throw AuthError.emptyData
                    }
                case 5000, 5202:
                    throw AuthError.invalidInput
                case 5210, 5211:
                    throw AuthError.userAlreadyExists
                case 5206:
                    throw AuthError.duplicatedNickname
                default:
                    throw AuthError.unknown
                }
            }
            .mapError(mapError)
            .eraseToAnyPublisher()
    }
    
    func checkNickname(dto: CheckNicknameDto) -> AnyPublisher<Bool, AuthError> {
        return NetworkingManager.shared.run(AuthEndpoint.checkNickname(dto), type: WardBaseResponse<Bool>.self)
            .tryMap { response in
                Log.debug(#file, #function, response)
                guard let duplicated = response.data else { return true }
                return duplicated
            }
            .mapError(mapError)
            .eraseToAnyPublisher()
    }
    
    func logOut(accessToken: String, refreshToken: String) -> AnyPublisher<String?, AuthError> {
        return NetworkingManager.shared.run(AuthEndpoint.logOut(accessToken: accessToken, refreshToken: refreshToken), type: WardBaseResponse<String?>.self)
            .tryMap { response in
                Log.debug(#file, #function, response)
                let code = response.code
                switch code {
                case 200:
                    return response.data ?? ""
                case 5207:
                    throw AuthError.invalidRefreshToken
                case 5213:
                    throw AuthError.failToLogOut
                default:
                    throw AuthError.unknown
                }
            }
            .mapError(mapError)
            .eraseToAnyPublisher()
    }
    
    func refreshToken(refreshToken: String) -> AnyPublisher<AuthResponse?, AuthError> {
        return NetworkingManager.shared.run(AuthEndpoint.refreshToken(refreshToken: refreshToken), type: WardBaseResponse<AuthResponse>.self)
            .tryMap { response in
                switch response.code {
                case 200:
                    return response.data
                default:
                    Log.debug(#file, #function, "토큰을 재발급 받는데 실패했습니다.")
                    return nil
                }
            }
            .mapError(mapError)
            .eraseToAnyPublisher()
    }
    
    private func mapError(error: Error) -> AuthError {
        if let error = error as? AuthError {
            return error
        }
        
        return .unknown
    }
}
