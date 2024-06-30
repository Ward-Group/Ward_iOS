//
//  WardBaseResponse.swift
//  WardApp
//
//  Created by peppermint100 on 6/5/24.
//

import Foundation

struct WardBaseResponse<T: Codable>: Codable {
    let message: String
    let code: Int
    let data: T?
}
