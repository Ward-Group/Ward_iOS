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
            HStack(alignment: .center, content: {
                bannerTitle
                Spacer()
                bannerTime
            }).padding([.leading, .trailing])
            bannerPager
        })
    }
}

// MARK: - View
extension BannerView {
    private var bannerPager: some View {
        var colors: [Color] = [Color.black, Color.blue]    // Test Lists
        return GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(colors.indices) { index in
                        colors[index]
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
        }.onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
    
    private var bannerTitle: some View {
        VStack(alignment: .leading, content: {
            Text(WardStrings.deadlineImminent).titleStyle
                .lineLimit(1)
            Spacer()
                .frame(height: 9)
            Text(WardStrings.enjoyTheLittleLuckYouHaveLeft)
                .lineLimit(1)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(WardAssets.Color.placeholderGray.swiftUIColor)
        })
    }
    
    private var bannerTime: some View {
        HStack(alignment: .center, content: {
            bannerTimeCircle(
                Text("09")
                    .foregroundColor(WardAssets.Color.accentColor.swiftUIColor),
                fill: WardAssets.Color.blue1.swiftUIColor)
            bannerTimeCircle(
                Text("11")
                    .foregroundColor(WardAssets.Color.blue1.swiftUIColor),
                fill: WardAssets.Color.accentColor.swiftUIColor)
            bannerTimeCircle(
                Text("03")
                    .foregroundColor(WardAssets.Color.blue1.swiftUIColor),
                fill: WardAssets.Color.accentColor.swiftUIColor)
        })
    }
    
    private func bannerTimeCircle(_ text: Text, fill: Color) -> some View {
        ZStack(alignment: .center, content: {
            Circle()
                .fill(fill)
            text
                .font(WardFonts.DSDigital.boldItalic.swiftUIFont(size: 25))
        })
        .frame(width: 41, height: 41)
    }
}

#Preview {
    BannerView()
}
