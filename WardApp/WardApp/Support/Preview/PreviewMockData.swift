//
//  PreviewMockData.swift
//  WardApp
//
//  Created by peppermint100 on 6/28/24.
//

import Foundation

enum PreviewMockData {
    
    static let brandItems: [BrandItem] = (1...4).map { index in
        BrandItem(
            itemId: index,
            itemKoreanName: "아이템 한국어 이름 \(index)",
            itemEnglishName: "Item English Name \(index)",
            itemCode: "ITEM\(index)",
            itemMainImage: "https://example.com/item\(index).jpg",
            itemViewCount: Int.random(in: 0...1000),
            itemWishCount: Int.random(in: 0...500)
        )
    }

    static let brands: [Brand] = (1...20).map { index in
        Brand(
            brandId: index,
            brandLogoImage: "https://example.com/brand\(index).jpg",
            brandKoreanName: "브랜드 한국어 이름 \(index)",
            brandEnglishName: "Brand English Name \(index)",
            brandViewCount: Int.random(in: 0...5000),
            brandWishCount: Int.random(in: 0...2000),
            itemList: brandItems.shuffled()
        )
    }
}
