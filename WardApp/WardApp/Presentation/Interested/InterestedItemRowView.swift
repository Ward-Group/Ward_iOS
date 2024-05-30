//
//  InterestedItemRowView.swift
//  WardApp
//
//  Created by peppermint100 on 5/29/24.
//

import SwiftUI

struct InterestedItemRowView: View {
    
    let item: InterestedItem
    
    var body: some View {
        ZStack {
            Color.background
            
            HStack {
                imagePlaceHolder
                VStack(alignment: .leading) {
                    brandAndLike
                    Spacer()
                    itemName
                    Spacer()
                    codeAndPrice
                }
            }
        }
    }
}

extension InterestedItemRowView {
    
    // TODO: API 연동시 이미지로 대체
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 85, height: 85)
            .foregroundStyle(Color.black1)
            .padding(.trailing, 5)
    }
    
    private var brandAndLike: some View {
        HStack {
            Text(item.brand)
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 12))
                .lineLimit(1)
            Spacer()
            WardAssets.Image.Icon.likeYesBorderless.swiftUIImage
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
    
    private var itemName: some View {
        Text(item.name)
            .lineLimit(2)
            .font(WardFonts.Pretendard.regular.swiftUIFont(size: 12))
    }
    
    private var codeAndPrice: some View {
        HStack {
            Text(item.code)
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 12))
                .lineLimit(1)
            Spacer()
            Text(item.price.formatPriceAsWon())
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                .lineLimit(1)
        }
    }
}

#Preview {
    InterestedItemRowView(item:
                            InterestedItem(
                                brand: "나이키", name: "조던 로우 1",
                                price: 139000, isLiked: true,
                                code: "0000-0000"
                            ))
    .frame(width: 343, height: 85)
}
