//
//  WardPagableResponse.swift
//  WardApp
//
//  Created by peppermint100 on 6/28/24.
//

import Foundation

struct WardPagableResponse<T: Codable>: Codable {
    let message: String
    let code: Int
    let data: PagableData<T>
}

struct PagableData<T: Codable>: Codable {
    let data: T
    let pageInfo: PageInfo
}
