//
//  BannerPageView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct BannerPageModel: Identifiable {
    var id: UUID
    var image: Image
    
    init(product: ExpiringProduct) {
        self.id = product.id
        self.image = product.image
    }
}

struct BannerPageView: View {
    
    let geo: GeometryProxy
    var list: [BannerPageModel]
    
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
