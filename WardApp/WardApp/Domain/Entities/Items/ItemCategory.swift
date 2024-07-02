//
//  ReleaseCategory.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import Foundation

/*

 - 카테고리 category = { `?` }
     - `all` : 전체
     - `clothing` : 의류
     - `footwear` : 신발
     - `accessory` : 악세서리
     - `other` : 기타
 */
enum ItemCategory: String {
    case all
    case clothing
    case footwear
    case accessory
    case other
    
    var title: String {
        switch self {
        case .all:
            WardStrings.all
        case .clothing:
            WardStrings.clothing
        case .footwear:
            WardStrings.footwear
        default:
            ""
        }
    }
}
