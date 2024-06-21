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
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .logOut(let accessToken, _):
            return [
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer \(accessToken)"
            ]
        default:
            return ["Content-Type": "application/json"]
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
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkNickname:
            return .get
        case .login, .signUp, .logOut:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login, .signUp:
            return JSONEncoding.default
        case .checkNickname:
            return URLEncoding.queryString
        case .logOut:
            return URLEncoding.httpBody
        }
    }
}
