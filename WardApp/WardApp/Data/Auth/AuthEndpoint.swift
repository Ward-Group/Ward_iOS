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
        }
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    var query: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .login(let dto):
            return [
                "provider": dto.provider.rawValue,
                "providerId": dto.providerId,
                "email": dto.email
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
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkNickname:
            return .get
        case .login, .signUp:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login, .signUp:
            return JSONEncoding.default
        case .checkNickname:
            return URLEncoding.queryString
        }
    }
}
