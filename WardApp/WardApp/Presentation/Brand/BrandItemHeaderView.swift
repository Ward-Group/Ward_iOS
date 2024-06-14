//
//  BrandListItemHeaderView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct BrandItemHeaderView: View {
    
    @Binding var item: BrandListItem
    let imageSize: CGFloat
    let buttonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.background
            
            GeometryReader { geo in
                HStack {
                    Circle()
                        .foregroundStyle(Color.gray2)
                        .frame(width: imageSize, height: imageSize)
                    
                    VStack(alignment: .leading) {
                        Text(item.nameKo)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
                            .foregroundStyle(Color.black0)
                        Text(item.nameEn)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                            .foregroundStyle(Color.darkGray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        buttonTapped()
                    }, label: {
                        if item.isLiked {
                            WardAssets.Image.Icon.likeYes.swiftUIImage
                        } else {
                            WardAssets.Image.Icon.likeNo.swiftUIImage
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    BrandItemHeaderView(
        item: .constant(BrandListItem(
            nameKo: "나이키", nameEn: "Nike",
            imageUrls: ["0", "1", "2", "3", "4"], isLiked: true,
            createdAt: Date.now)),
        imageSize: 200,
        buttonTapped: {}
    )
}
