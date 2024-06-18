//
//  BrandItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import Foundation

struct BrandListItem: Codable {
    let nameKo: String
    let nameEn: String
    let imageUrls: [String]
    var isLiked: Bool
    let createdAt: Date
}
