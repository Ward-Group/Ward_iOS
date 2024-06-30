//
//  PageInfo.swift
//  WardApp
//
//  Created by peppermint100 on 6/28/24.
//

import Foundation

struct PageInfo: Codable {
    let page: Int
    let size: Int
    let totalElements: Int
    let totalPages: Int
    
    init(page: Int, size: Int, totalElements: Int, totalPages: Int) {
        self.page = page
        self.size = size
        self.totalElements = totalElements
        self.totalPages = totalPages
    }
    
    init() {
        self.page = 1
        self.size = 0
        self.totalElements = 0
        self.totalPages = 1
    }
}
