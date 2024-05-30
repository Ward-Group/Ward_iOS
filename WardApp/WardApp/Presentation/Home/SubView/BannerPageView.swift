//
//  BannerPageView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct BannerPageView: View {
    
    // TODO: 배너 이미지 임시 모델
    struct ImageModel: Identifiable {
        let id = UUID()
        let image: Image = WardAssets.Image.homeBanner.swiftUIImage
    }
    
    let geo: GeometryProxy
    let list: [ImageModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(list) { model in
                    model.image
                        .resizable()
                        .frame(width: geo.size.width - 32, height: (geo.size.width - 32) * 0.58)
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 16)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}
