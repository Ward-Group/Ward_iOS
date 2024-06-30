//
//  BrandListItemRowView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct BrandListItemRowView: View {
    
    @Binding var brand: Brand
    
    var body: some View {
        ZStack {
            Color.background
            
            GeometryReader { geo in
                let circleImageSize = geo.size.width * 0.15
                let rectangleImagePadding: CGFloat = 10
                let rectangleImageSize = geo.size.width / 2.5 - rectangleImagePadding * 2
                
                VStack(spacing: 10) {
                    BrandItemHeaderView(brand: $brand, imageSize: circleImageSize)
                        .frame(height: circleImageSize)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(brand.itemList) { brandItem in
                                AsyncImage(
                                    url: URL(string: brandItem.itemMainImage ?? ""),
                                    content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: rectangleImageSize, height: rectangleImageSize)
                                    }, placeholder: {
                                        Rectangle()
                                            .frame(width: rectangleImageSize, height: rectangleImageSize)
                                            .foregroundStyle(Color.gray2)
                                    }
                                )
                                
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

#Preview {
    BrandListItemRowView(
        brand: .constant(PreviewMockData.brands.first!)
    )
    .frame(height: 250)
}
