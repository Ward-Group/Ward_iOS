//
//  BrandListItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct BrandDetailItem: Identifiable {
    let id = UUID()
    let brand: String
    let name: String
    let price: Int
}
