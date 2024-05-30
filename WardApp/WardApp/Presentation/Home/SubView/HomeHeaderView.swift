//
//  HomeHeaderView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct HomeHeaderView: View {
    var title: String
    var subTitle: String?
    var moreButtonAction: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9, content: {
            HStack(alignment: .center, content: {
                Text(title).titleStyle
                    .lineLimit(1)
                Spacer()
                if let moreButtonAction {
                    moreButton
                        .onTapGesture {
                            moreButtonAction()
                        }
                }
            })
            if let subTitle, !subTitle.isEmpty {
                Text(subTitle)
                    .lineLimit(1)
                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                    .foregroundStyle(Color.black7)
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

extension HomeHeaderView {
    
    private var moreButton: some View {
            HStack(spacing: 0) {
                Text(WardStrings.showMore)
                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                    .foregroundStyle(Color.darkGray)
                WardAssets.Image.Icon.chevronRight.swiftUIImage
            }
    }
}

#Preview {
    HomeHeaderView(title: "실시간 Top 10", subTitle: "오늘 19:00 기준", moreButtonAction: {
        print("HomeHeaderView 더보기 버튼 액션")
    })
}
