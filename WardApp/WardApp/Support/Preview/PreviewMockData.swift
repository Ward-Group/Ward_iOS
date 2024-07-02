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
    
    static let releasedItems: [ReleasedItem] = [
        ReleasedItem(releaseInfoId: 1,
                     platformKoreanName: "플랫폼 한글명1",
                     platformEnglishName: "Platform English Name1",
                     itemId: "item_id_1",
                     itemMainImage: "main_image_url_1",
                     itemKoreanName: "아이템 한글명1",
                     itemEnglishName: "Item English Name1",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-01"),
        
        ReleasedItem(releaseInfoId: 2,
                     platformKoreanName: "플랫폼 한글명2",
                     platformEnglishName: "Platform English Name2",
                     itemId: "item_id_2",
                     itemMainImage: "main_image_url_2",
                     itemKoreanName: "아이템 한글명2",
                     itemEnglishName: "Item English Name2",
                     releaseMethod: .entry,
                     dueDate: "2024-07-02"),
        
        ReleasedItem(releaseInfoId: 3,
                     platformKoreanName: "플랫폼 한글명3",
                     platformEnglishName: "Platform English Name3",
                     itemId: "item_id_3",
                     itemMainImage: "main_image_url_3",
                     itemKoreanName: "아이템 한글명3",
                     itemEnglishName: "Item English Name3",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-03"),
        
        ReleasedItem(releaseInfoId: 4,
                     platformKoreanName: "플랫폼 한글명4",
                     platformEnglishName: "Platform English Name4",
                     itemId: "item_id_4",
                     itemMainImage: "main_image_url_4",
                     itemKoreanName: "아이템 한글명4",
                     itemEnglishName: "Item English Name4",
                     releaseMethod: .entry,
                     dueDate: "2024-07-04"),
        
        ReleasedItem(releaseInfoId: 5,
                     platformKoreanName: "플랫폼 한글명5",
                     platformEnglishName: "Platform English Name5",
                     itemId: "item_id_5",
                     itemMainImage: "main_image_url_5",
                     itemKoreanName: "아이템 한글명5",
                     itemEnglishName: "Item English Name5",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-05"),
        
        ReleasedItem(releaseInfoId: 6,
                     platformKoreanName: "플랫폼 한글명6",
                     platformEnglishName: "Platform English Name6",
                     itemId: "item_id_6",
                     itemMainImage: "main_image_url_6",
                     itemKoreanName: "아이템 한글명6",
                     itemEnglishName: "Item English Name6",
                     releaseMethod: .entry,
                     dueDate: "2024-07-06"),
        
        ReleasedItem(releaseInfoId: 7,
                     platformKoreanName: "플랫폼 한글명7",
                     platformEnglishName: "Platform English Name7",
                     itemId: "item_id_7",
                     itemMainImage: "main_image_url_7",
                     itemKoreanName: "아이템 한글명7",
                     itemEnglishName: "Item English Name7",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-07"),
        
        ReleasedItem(releaseInfoId: 8,
                     platformKoreanName: "플랫폼 한글명8",
                     platformEnglishName: "Platform English Name8",
                     itemId: "item_id_8",
                     itemMainImage: "main_image_url_8",
                     itemKoreanName: "아이템 한글명8",
                     itemEnglishName: "Item English Name8",
                     releaseMethod: .entry,
                     dueDate: "2024-07-08"),
        
        ReleasedItem(releaseInfoId: 9,
                     platformKoreanName: "플랫폼 한글명9",
                     platformEnglishName: "Platform English Name9",
                     itemId: "item_id_9",
                     itemMainImage: "main_image_url_9",
                     itemKoreanName: "아이템 한글명9",
                     itemEnglishName: "Item English Name9",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-09"),
        
        ReleasedItem(releaseInfoId: 10,
                     platformKoreanName: "플랫폼 한글명10",
                     platformEnglishName: "Platform English Name10",
                     itemId: "item_id_10",
                     itemMainImage: "main_image_url_10",
                     itemKoreanName: "아이템 한글명10",
                     itemEnglishName: "Item English Name10",
                     releaseMethod: .entry,
                     dueDate: "2024-07-10"),
        
        ReleasedItem(releaseInfoId: 11,
                     platformKoreanName: "플랫폼 한글명11",
                     platformEnglishName: "Platform English Name11",
                     itemId: "item_id_11",
                     itemMainImage: "main_image_url_11",
                     itemKoreanName: "아이템 한글명11",
                     itemEnglishName: "Item English Name11",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-11"),
        
        ReleasedItem(releaseInfoId: 12,
                     platformKoreanName: "플랫폼 한글명12",
                     platformEnglishName: "Platform English Name12",
                     itemId: "item_id_12",
                     itemMainImage: "main_image_url_12",
                     itemKoreanName: "아이템 한글명12",
                     itemEnglishName: "Item English Name12",
                     releaseMethod: .entry,
                     dueDate: "2024-07-12"),
        
        ReleasedItem(releaseInfoId: 13,
                     platformKoreanName: "플랫폼 한글명13",
                     platformEnglishName: "Platform English Name13",
                     itemId: "item_id_13",
                     itemMainImage: "main_image_url_13",
                     itemKoreanName: "아이템 한글명13",
                     itemEnglishName: "Item English Name13",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-13"),
        
        ReleasedItem(releaseInfoId: 14,
                     platformKoreanName: "플랫폼 한글명14",
                     platformEnglishName: "Platform English Name14",
                     itemId: "item_id_14",
                     itemMainImage: "main_image_url_14",
                     itemKoreanName: "아이템 한글명14",
                     itemEnglishName: "Item English Name14",
                     releaseMethod: .entry,
                     dueDate: "2024-07-14"),
        
        ReleasedItem(releaseInfoId: 15,
                     platformKoreanName: "플랫폼 한글명15",
                     platformEnglishName: "Platform English Name15",
                     itemId: "item_id_15",
                     itemMainImage: "main_image_url_15",
                     itemKoreanName: "아이템 한글명15",
                     itemEnglishName: "Item English Name15",
                     releaseMethod: .fcfs,
                     dueDate: "2024-07-15")
    ]
}
