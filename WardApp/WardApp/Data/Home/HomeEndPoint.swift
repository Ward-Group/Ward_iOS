//
//  HomeEndPoint.swift
//  WardApp
//
//  Created by suni on 7/10/24.
//

import Alamofire

enum HomeEndPoint {
    case releaseInfos(section: String)
}

extension HomeEndPoint: Endpoint {
    var path: String {
        switch self {
        case .releaseInfos(let section):
            return "/release-infos/\(section)/home"
        }
    }
    
    var headers: HTTPHeaders {
        return ["Accept": "application/json"]
    }
    
    var query: [String: String] {
        [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .releaseInfos: 
            return ["category": "all"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .releaseInfos: 
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .releaseInfos: 
            return URLEncoding.queryString
        }
    }
}
