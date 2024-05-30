//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderNavBarView(showSearching: true, showNotification: true)
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: true, content: {
                    LazyVStack(spacing: 0) {
                        // --- 오늘 마감 --- //
                        HomeHeaderView(title: WardStrings.dueToday, subTitle: WardStrings.enjoyTheLittleLuckYouHaveLeft)
                        Spacer()
                            .frame(height: 12)
                        // TODO: 배너 이미지 API 연결
                        BannerPageView(geo: geo, list: [.init(), .init(), .init(), .init(), .init()])
                        Spacer()
                            .frame(height: 36)
                        // -- 발매 상품 -- //
                        HomeHeaderView(title: WardStrings.releasedProduct, moreButtonAction: {
                            print("발매 상품 더보기 버튼 액션")
                        })
                        Spacer()
                            .frame(height: 14)
                        // TODO: 카테고리 API 연결
                        CategoryTabView(list: [CategoryTabView.CategoryData(title: "오늘 마감", isSelect: true),
                                           CategoryTabView.CategoryData(title: "발매 중", isSelect: false),
                                           CategoryTabView.CategoryData(title: "관심 상품", isSelect: false),
                                           CategoryTabView.CategoryData(title: "발매 확장", isSelect: false),
                                           CategoryTabView.CategoryData(title: "오늘 등록", isSelect: false)])
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    HomeView()
}
