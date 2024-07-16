//
//  ReleaseItemHorizontalView.swift
//  WardApp
//
//  Created by suni on 7/11/24.
//

import SwiftUI

struct ReleaseItemHorizontalView: View {

    let model: HomeReleaseItem

    var body: some View {
        ZStack {
            Color.background
            HStack(spacing: 0) {
                imagePlaceHolder
                    .frame(width: 72, height: 72)
                    .padding(.leading, 16)
                    .padding(.trailing, 12)
                VStack(alignment: .leading, spacing: 4) {
                    Text(model.platformKoreanName)
                        .foregroundStyle(Color.black3)
                        .lineLimit(1)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                    Text(model.itemKoreanName)
                        .foregroundStyle(Color.black6)
                        .lineLimit(1)
                        .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
                    // TODO: 남은 시간 타이머 개발
                    Text(model.dueDate)
                        .foregroundStyle(Color.mainRed)
                        .lineLimit(1)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                }
                Spacer()
                Text(model.releaseMethod.description)
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
                    .frame(height: 34)
                    .padding(.horizontal, 10)
                    .foregroundColor(Color.white)
                    .background(Color.mainBlue)
                    .cornerRadius(16)
                    .padding(.trailing, 16)
            }
        }
    }
}

extension ReleaseItemHorizontalView {
    
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.mainGray)
    }
}

#Preview {
    ReleaseItemHorizontalView(
        model: HomePreviewMockData.releaseItems[0]
    )
}
