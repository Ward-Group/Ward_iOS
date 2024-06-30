//
//  Brand.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Foundation

struct Brand: Codable, Identifiable {
    let brandId: Int
    let brandLogoImage: String?
    let brandKoreanName: String
    let brandEnglishName: String
    let brandViewCount: Int
    let brandWishCount: Int
    let itemList: [BrandItem]
    
    var id: Int {
        brandId
    }
}
