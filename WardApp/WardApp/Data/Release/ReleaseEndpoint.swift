//
//  ReleaseEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Alamofire

enum ReleaseEndpoint {
    case dueToday(accessToken: String)
}

extension ReleaseEndpoint: Endpoint {
    var path: String {
        switch self {
        case .dueToday:
            return "/release-infos"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .dueToday(let accessToken):
            [
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer \(accessToken)"
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
            return URLEncoding.queryString
        }
    }
}
