//
//  ReleasedItemGridView.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI

struct ReleasedItemGridView: View {
    
    let geo: GeometryProxy
    let item: Item
    
    var body: some View {
        let imageSize = geo.size.width * 0.44
        
        ZStack {
            Color.background
            
            VStack(alignment: .leading, spacing: 5) {
                AsyncImage(
                    url: URL(string: item.itemMainImage ?? ""),
                    content: { image in
                        image
                            .resizable()
                            .frame(width: imageSize, height: imageSize)
                    },
                    placeholder: {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.mainGray)
                            .frame(width: imageSize, height: imageSize)
                    }
                )
                
                Text(item.brandKoreanName)
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 12))
                    .foregroundStyle(Color.black3)
                Text(item.itemKoreanName)
                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                    .foregroundStyle(Color.black5)
                    .lineLimit(2)
                Text(20090.formatPriceAsWon())
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 12))
                    .foregroundStyle(Color.black5)
            }
        }
    }
}

#Preview {
    GeometryReader { geo in
        ReleasedItemGridView(geo: geo, item: PreviewMockData.items.first!)
    }
}
