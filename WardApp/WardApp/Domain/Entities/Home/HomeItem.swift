//
//  HomeItem.swift
//  WardApp
//
//  Created by suni on 7/11/24.
//

import Foundation

// TODO: - 상품 Entity 병합 필요

struct HomeItem: Codable, Identifiable {
    let itemId: Int
    let itemKoreanName: String
    let itemEnglishName: String
    let price: String
    let itemMainImage: String
    let brandId: Int
    let brandKoreanName: String
    let brandEnglishName: String
    let isWished: Bool
    
    var id: Int {
        itemId
    }
}
