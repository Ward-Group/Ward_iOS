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
            
            GeometryReader { geo in
                let itemImageSize = geo.size.width * 0.22
                let likeImageSize = geo.size.width * 0.06
                
                HStack {
                    imagePlaceHolder
                        .frame(width: itemImageSize, height: itemImageSize)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            brand
                            Spacer()
                            like
                                .frame(width: likeImageSize, height: likeImageSize)
                        }
                        Spacer()
                        itemName
                        Spacer()
                        codeAndPrice
                    }
                }
            }
        }
    }
}

extension InterestedItemRowView {
    
    // TODO: API 연동시 이미지로 대체
    private var imagePlaceHolder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.black1)
            .padding(.trailing, 5)
    }
    
    private var brand: some View {
        Text(item.brand)
            .font(WardFonts.Pretendard.bold.swiftUIFont(size: 12))
            .lineLimit(1)
    }
    
    private var like: some View {
        WardAssets.Image.Icon.likeYesBorderless.swiftUIImage
            .resizable()
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
