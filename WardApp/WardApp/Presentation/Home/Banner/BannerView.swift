//
//  BannerView.swift
//  WardApp
//
//  Created by suni on 5/28/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack(content: {
            bannerTitle
            Spacer()
                .frame(height: 12)
            bannerPager
            Spacer()
                .frame(height: 38)
        })
    }
}

// MARK: - View
extension BannerView {
    private var bannerPager: some View {
        // TODO: 이미지 연걸 예정
        return GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 10) {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue1)
                            .frame(width: proxy.size.width - 32, height: (proxy.size.width - 32) * 0.58)
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 16)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        }
    }
    
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
    BannerView()
}
