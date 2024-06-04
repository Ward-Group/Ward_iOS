//
//  SearchHistory.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import Foundation

struct SearchHistory: Codable {
    let id: UUID
    let term: String
    var createdAt = Date.now
    
    mutating func refresh() {
        self.createdAt = Date.now
    }
}
