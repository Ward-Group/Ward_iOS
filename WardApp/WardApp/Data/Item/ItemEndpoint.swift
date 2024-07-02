//
//  ItemsEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Alamofire

enum ItemEndpoint {
    case items(category: ItemCategory, sort: ItemSortOption, page: Int)
}

extension ItemEndpoint: Endpoint {
    var path: String {
        switch self {
        case .items:
            return "/items"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .items:
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
        case .items(let category, let sort, let page):
            [
                "category": category.rawValue,
                "sort": sort.rawValue,
                "page": "\(page)"
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .items:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .items:
            return URLEncoding.queryString
        }
    }
}

