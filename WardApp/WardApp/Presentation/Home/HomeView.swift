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
                        VStack(spacing: 12, content: {
                            bannerTitle
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
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

extension HomeView {
    private var bannerTitle: some View {
        VStack(alignment: .leading, spacing: 9, content: {
            Text(WardStrings.deadlineImminent).titleStyle
                .lineLimit(1)
            Text(WardStrings.enjoyTheLittleLuckYouHaveLeft)
                .lineLimit(1)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.placeholderGray)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView()
}
