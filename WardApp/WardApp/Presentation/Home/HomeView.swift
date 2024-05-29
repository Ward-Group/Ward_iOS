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
                    LazyVStack(spacing: 36) {
                        VStack(spacing: 12, content: {
                            // --- 오늘 마감 --- //
                            bannerHeader
                            bannerList(geo)
                        })
                        
                        // -- 발매 상품 -- //
                        VStack(spacing: 0, content: {
                            // --- 오늘 마감 --- //
                            releasedProductHeader
                            Spacer()
                                .frame(height: 14)
                            releasedCategory
                        })
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

extension HomeView {
    // --- 오늘 마감 --- //
    private var bannerHeader: some View {
        VStack(alignment: .leading, spacing: 9, content: {
            Text(WardStrings.dueToday).titleStyle
                .lineLimit(1)
            Text(WardStrings.enjoyTheLittleLuckYouHaveLeft)
                .lineLimit(1)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.placeholderGray)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    private func bannerList(_ geo: GeometryProxy) -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 10) {
                // TODO: 오늘 마감 배너 데이터 연결
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue1)
                        .frame(width: geo.size.width - 32, height: (geo.size.width - 32) * 0.58)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 16)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
    
    // -- 발매 상품 -- //
    private var releasedProductHeader: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            Text(WardStrings.releasedProduct).titleStyle
                .lineLimit(1)
            Spacer()
            moreButton
                .onTapGesture {
                    // TODO: 발매 상품 더보기 버튼 연결
                    print("moreButton action")
                }
            
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    private var releasedCategory: some View {
        // TODO: 발매 상품 카테고리 데이터 연결
        let list: [String] = ["오늘 마감", "발매 중", "관심 상품", "발매 확장", "오늘 등록"]
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 6) {
                ForEach(list, id: \.self) { str in
                    roundTextView(str)
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func roundTextView(_ text: String) -> some View {
        return Text(text)
            .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
            .frame(height: 32)
            .padding(.horizontal, 10)
            .foregroundColor(Color.white)
            .background(Color.mainBlue)
            .cornerRadius(16)
    }

    private var moreButton: some View {
        HStack(spacing: 0) {
            Text(WardStrings.showMore)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.darkGray)
            WardAssets.Image.Icon.chevronRight.swiftUIImage
        }
    }}

#Preview {
    HomeView()
}
