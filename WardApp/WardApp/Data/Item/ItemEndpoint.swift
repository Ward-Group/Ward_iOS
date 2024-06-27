//
//  ItemsEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Alamofire

enum ItemEndpoint {
    case releaseNow
}

extension ItemEndpoint: Endpoint {
    var path: String {
        switch self {
        case .releaseNow:
            return "/items"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .releaseNow:
            return [
                "Accept": "application/json"
            ]
        }
    }
    
    var query: [String: String] {
        [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .releaseNow:
            ["sort":"release-now"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .releaseNow:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .releaseNow:
            return URLEncoding.queryString
        }
    }
}

