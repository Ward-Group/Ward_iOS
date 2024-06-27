//
//  Items.swift
//  WardApp
//
//  Created by peppermint100 on 6/27/24.
//

import Foundation

/*
 "itemKoreanName": "상품이름37",
 "itemEnglishName": "itemName37",
 "itemCode": "상품코드37",
 "itemMainImage": null,
 "brandKoreanName": "브랜드이름10",
 "brandEnglishName": "brandName10",
 "wished": false
 */
struct Item: Codable, Identifiable {
    let itemKoreanName: String
    let itemEnglishName: String
    let itemCode: String
    let itemMainImage: String?
    let brandKoreanName: String
    let brandEnglishName: String
    let wished: Bool
    
    var id: String {
        itemCode
    }
}
