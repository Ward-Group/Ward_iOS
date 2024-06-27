//
//  AuthEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Alamofire

enum AuthEndpoint {
    case login(LoginDto)
    case signUp(SignUpDto)
    case checkNickname(CheckNicknameDto)
    case logOut(accessToken: String, refreshToken: String)
    case refreshToken(refreshToken: String)
}

extension AuthEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signUp:
            return "/auth"
        case .checkNickname:
            return "/auth/checkNickname"
        case .logOut:
            return "/auth/logout"
        case .refreshToken:
            return "/auth/refresh"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .logOut(let accessToken, _):
            return HTTPHeaders([
                .contentType("application/x-www-form-urlencoded")
            ])
        case .refreshToken:
             return HTTPHeaders([
                .contentType("application/x-www-form-urlencoded")
            ])           
        default:
            return HTTPHeaders([
                .contentType("application/json")
            ])
        }
    }
    
    var query: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .login(let dto):
            return [
                "provider": dto.provider.rawValue,
                "providerId": dto.providerId
            ]
        case .signUp(let dto):
            Log.debug(#file, #function, dto)
            return [
                "provider": dto.provider.rawValue,
                "providerId": dto.providerId,
                "name": dto.name,
                "email": dto.email,
                "nickname": dto.nickname,
                "appPushNotification": dto.appPushNotification,
                "emailNotification": dto.emailNotification,
                "snsNotification": dto.snsNotification
            ]
        case .checkNickname(let dto):
            return ["nickname": dto.nickname]
        case .logOut(_, let refreshToken):
            return ["refreshToken": refreshToken]
        case .refreshToken(let refreshToken):
            return ["refreshToken": refreshToken]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkNickname:
            return .get
        case .login, .signUp, .logOut, .refreshToken:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login, .signUp:
            return JSONEncoding.default
        case .checkNickname:
            return URLEncoding.queryString
        case .logOut, .refreshToken:
            return URLEncoding.httpBody
        }
    }
}
