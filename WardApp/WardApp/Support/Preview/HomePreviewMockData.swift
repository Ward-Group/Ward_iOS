//
//  HomePreviewMockData.swift
//  WardApp
//
//  Created by suni on 7/16/24.
//

import Foundation

enum HomePreviewMockData {
    static let header = HomeHeaderTitleView(title: "실시간 Top 10", subTitle: "오늘 19:00 기준", moreButtonAction: {
        print("HomeHeaderView 더보기 버튼 액션")
    })
    
    static let items: [HomeItem] = (1...10).map { index in
        return HomeItem(
            itemId: index,
            itemKoreanName: "상품명 \(index)",
            itemEnglishName: "Product Name \(index)",
            price: "\(Int.random(in: 10...300))00원",
            itemMainImage: "https://st.depositphotos.com/2274151/4841/i/450/depositphotos_48410095-stock-photo-sample-blue-square-grungy-stamp.jpg",
            brandId: index,
            brandKoreanName: "브랜드명 \(index)",
            brandEnglishName: "Brand Name \(index)",
            isWished: [true, false].randomElement() ?? true
        )
    }
    
    static let releaseItems: [HomeReleaseItem] = (1...10).map { index in
        return HomeReleaseItem(
            releaseInfoId: index,
            platformKoreanName: "사이트명 \(index)",
            platformEnglishName: "Site Name \(index)",
            itemId: index,
            itemMainImage: "https://st.depositphotos.com/2274151/4841/i/450/depositphotos_48410095-stock-photo-sample-blue-square-grungy-stamp.jpg",
            itemKoreanName: "상품명 \(index)",
            itemEnglishName: "Product Name \(index)",
            releaseMethod: [ReleaseMethod.entry, ReleaseMethod.fcfs].randomElement() ?? .entry,
            releaseDate: "발매 날짜시간",
            dueDate: "마감 날짜시간"
        )
    }
}
