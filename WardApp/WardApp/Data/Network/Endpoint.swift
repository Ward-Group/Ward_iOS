//
//  Endpoint.swift
//  WardApp
//
//  Created by peppermint100 on 5/28/24.
//

import Foundation
import Alamofire

protocol Endpoint {
    var baseURL: String { get }
    var url: URL { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var query: [String: String] { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = self.baseURL
        components.path = self.path
        return components.url!
    }
    
    var baseURL: String {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "WARD_SERVICE_HOST") as? String else {
            return ""
        }
        return host
    }
}
