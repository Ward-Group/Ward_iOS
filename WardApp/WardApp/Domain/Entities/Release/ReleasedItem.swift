//
//  ReleasedItem.swift
//  WardApp
//
//  Created by peppermint100 on 6/26/24.
//

import Foundation

struct ReleasedItem: Codable, Identifiable {
    let releaseInfoId: Int
    let platformKoreanName: String
    let platformEnglishName: String
    let itemId: String
    let itemMainImage: String
    let itemKoreanName: String
    let itemEnlishName: String
    let releaseMethod: String
    let dueDate: String
    
    var id: Int {
        releaseInfoId
    }
}
