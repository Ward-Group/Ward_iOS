//
//  SearchResultItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import Foundation

struct SearchResultItem: Identifiable {
    let brand: String
    let name: String
    let retailer: String
    let hits: Int
    let id = UUID()
}
