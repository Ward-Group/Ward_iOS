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
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(alignment: .top, spacing: 10) {
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
                        })
                        
                        // -- 발매 상품 -- //
                        releasedProductHeader
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

extension HomeView {
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
    
    private var releasedProductHeader: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            Text(WardStrings.releasedProduct).titleStyle
                .lineLimit(1)
            Spacer()
            getMoreButton {
                print("getMoreButton action")
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    private func getMoreButton(action: @escaping () -> Void) -> some View {
        return Button(action: action) {
            Text(WardStrings.showMore)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.darkGray)
            WardAssets.Image.Icon.chevronRight.swiftUIImage
        }
    }
}

#Preview {
    HomeView()
}
