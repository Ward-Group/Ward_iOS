//
//  BrandListItemRowView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI

struct BrandListItemRowView: View {
    
    @Binding var item: BrandListItem
    var buttonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.background
            
            GeometryReader { geo in
                let circleImageSize = geo.size.width * 0.15
                let rectangleImagePadding: CGFloat = 10
                let rectangleImageSize = geo.size.width / 2.5 - rectangleImagePadding * 2
                
                VStack(spacing: 10) {
                    BrandItemHeaderView(item: $item, imageSize: circleImageSize, buttonTapped: buttonTapped)
                        .frame(height: circleImageSize)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(item.imageUrls, id: \.self) { _ in
                                Rectangle()
                                    .frame(width: rectangleImageSize, height: rectangleImageSize)
                                    .foregroundStyle(Color.gray2)
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
        item: .constant(BrandListItem(
            nameKo: "나이키", nameEn: "Nike",
            imageUrls: ["0", "1", "2", "3", "4"], isLiked: true,
            createdAt: Date.now)),
        buttonTapped: {}
    )
    .frame(height: 250)
}
