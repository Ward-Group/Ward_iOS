//
//  BrandItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Foundation

struct BrandItem: Codable, Identifiable {
    let itemId: Int
    let itemKoreanName: String
    let itemEnglishName: String
    let itemCode: String
    let itemMainImage: String?
    let itemViewCount: Int
    let itemWishCount: Int
    
    var id: Int {
        itemId
    }
}
