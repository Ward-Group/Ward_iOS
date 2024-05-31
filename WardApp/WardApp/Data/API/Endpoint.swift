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
    var headers: [String: String] { get }
    var query: [String: String] { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
    var encoding: URLEncoding { get }
}

extension Endpoint {
    var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = self.baseURL
      components.path = self.path
      components.queryItems = self.query.map { URLQueryItem(name: $0, value: $1) }
      return components.url!
    }
}
