//
//  ItemHorizontalView.swift
//  WardApp
//
//  Created by suni on 7/11/24.
//

import SwiftUI

struct ItemHorizontalView: View {
    let rank: String
    let model: HomeItem

    var body: some View {
        ZStack {
            Color.background
            HStack(spacing: 0) {
                Text(rank)
                    .foregroundStyle(Color.black6)
                    .lineLimit(1)
                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                    .padding(.leading, 26)
                    .padding(.trailing, 14)
                imagePlaceHolder
                    .frame(width: 72, height: 72)
                    .padding(.trailing, 14)
                VStack(alignment: .leading, spacing: 4) {
                    Text(model.brandKoreanName)
                        .foregroundStyle(Color.black3)
                        .lineLimit(1)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                    Text(model.itemKoreanName)
                        .foregroundStyle(Color.black6)
                        .lineLimit(1)
                        .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                }
                Spacer()
                WardAssets.Image.Icon.likeNo.swiftUIImage
                    .padding(20)
            }
        }
    }
}

extension ItemHorizontalView {
    
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.mainGray)
    }
}

#Preview {
    ItemHorizontalView(
        rank: "01",
        model: HomeItem(
            itemId: 0,
            itemKoreanName: "상품명",
            itemEnglishName: "product name",
            price: "10,000",
            itemMainImage: "",
            brandId: 0,
            brandKoreanName: "브랜드명",
            brandEnglishName: "brand name",
            isWished: false
        )
    )
}
