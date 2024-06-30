//
//  BrandEndpoint.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Alamofire

enum BrandEndpoint {
    case brandsOrderByRanking(page: Int)
    case brandsOrderByKoreanAlphabet(page: Int)
    case brandsOrderByAlphabet(page: Int)
    case increaseBrandViewCount(brandId: String)
    case removeBrandFromWishList(brandId: String)
}

extension BrandEndpoint: Endpoint {
    var path: String {
        switch self {
        case .brandsOrderByRanking, .brandsOrderByAlphabet, .brandsOrderByKoreanAlphabet:
            "/brands"
        case .increaseBrandViewCount(let brandId):
            "/brands/\(brandId)/view-counts"
        case .removeBrandFromWishList(let brandId):
            "/wish-brands/\(brandId)"
        }
    }
    
    var headers: HTTPHeaders {
        [.contentType("application/json")]
    }
    
    var query: [String: String] {
        [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .brandsOrderByRanking(let page):
            ["sort": "ranking", "page": "\(page)"]
        case .brandsOrderByKoreanAlphabet(let page):
            ["sort": "korean-alphabetical", "page": "\(page)"]
        case .brandsOrderByAlphabet(let page):
            ["sort": "alphabetical", "page": "\(page)"]
        case .increaseBrandViewCount, .removeBrandFromWishList:
            [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .brandsOrderByRanking, .brandsOrderByAlphabet, .brandsOrderByKoreanAlphabet:
                .get
        case .increaseBrandViewCount:
                .patch
        case .removeBrandFromWishList:
                .delete
        }
    }
    
    var encoding: ParameterEncoding {
        URLEncoding.queryString
    }
}

