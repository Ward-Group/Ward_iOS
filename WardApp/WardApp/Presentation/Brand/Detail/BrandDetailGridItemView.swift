//
//  BrandGridItemView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct BrandDetailGridItemView: View {
    
    let geo: GeometryProxy
    let item: BrandDetailItem
    
    var body: some View {
        let imageSize = geo.size.width / 2 - 30
        
        ZStack {
            Color.background
            
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color.gray2)
                    .frame(width: imageSize, height: imageSize)
                
                Text(item.brand)
                    .foregroundStyle(Color.black3)
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 12))
                
                Text(item.name)
                    .foregroundStyle(Color.black5)
                    .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                
                Text(item.price.formatPriceAsWon())
                    .foregroundStyle(Color.black5)
                    .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 12))
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        BrandDetailGridItemView(geo: geometry, item: BrandDetailItem(brand: "나이키", name: "덩크 하이", price: 129900))
    })
}
