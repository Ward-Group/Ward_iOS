//
//  HomeReleaseItem.swift
//  WardApp
//
//  Created by suni on 7/11/24.
//

import Foundation

// TODO: - 발매 상품 Entity 병합 필요

struct HomeReleaseItem: Codable, Identifiable {
    let releaseInfoId: Int
    let platformKoreanName: String
    let platformEnglishName: String
    let itemId: Int
    let itemMainImage: String
    let itemKoreanName: String
    let itemEnglishName: String
    let releaseMethod: ReleaseMethod
    let dueDate: String
    
    var id: Int {
        releaseInfoId
    }
}

