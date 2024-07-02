//
//  ReleaseEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Alamofire

enum ReleaseEndpoint {
    case releaseInfos(category: ItemCategory, sort: ItemSortOption, page: Int)
}

extension ReleaseEndpoint: Endpoint {
    var path: String {
        switch self {
        case .releaseInfos:
            return "/release-infos"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .releaseInfos:
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
        case .releaseInfos(let category, let sort, let page):
            [
                "category": category.rawValue,
                "sort": sort.rawValue,
                "page": "\(page)"
            ]
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
