//
//  BrandListItemHeaderView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct BrandItemHeaderView: View {
    
    @Binding var brand: Brand
    let imageSize: CGFloat
    
    var body: some View {
        ZStack {
            Color.background
            GeometryReader { geo in
                HStack {
                    AsyncImage(
                        url: URL(string: brand.brandLogoImage ?? ""),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: imageSize, height: imageSize)
                        }, placeholder: {
                            Circle()
                                .foregroundStyle(Color.gray2)
                                .frame(width: imageSize, height: imageSize)
                        }
                    )
                    
                    VStack(alignment: .leading) {
                        Text(brand.brandKoreanName)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
                            .foregroundStyle(Color.black0)
                        Text(brand.brandEnglishName)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                            .foregroundStyle(Color.darkGray)
                    }
                }
            }
        }
    }
}

#Preview {
    BrandItemHeaderView(
        brand: .constant(PreviewMockData.brands.first!),
        imageSize: 70
    )
}
