//
//  AuthEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Alamofire

enum AuthEndpoint {
    case login(LoginDto)
    case signUp
}

extension AuthEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signUp:
            return "/auth"
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
                "provider": dto.provider,
                "providerId": dto.providerId,
                "email": dto.email
            ]
        case .signUp:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var encoding: URLEncoding {
        return .default
    }
}
