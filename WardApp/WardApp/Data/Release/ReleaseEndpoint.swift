//
//  ReleaseEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Alamofire

enum ReleaseEndpoint {
    case dueToday
}

extension ReleaseEndpoint: Endpoint {
    var path: String {
        switch self {
        case .dueToday:
            return "/release-infos"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .dueToday:
            return [
                "Accept": "application/json"
            ]
        }
    }
    
    var query: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .dueToday:
            ["sort": "due-today"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .dueToday:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .dueToday:
            return URLEncoding.default
        }
    }
}
