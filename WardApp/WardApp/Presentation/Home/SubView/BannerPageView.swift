//
//  BannerPageView.swift
//  WardApp
//
//  Created by suni on 5/30/24.
//

import SwiftUI

struct BannerPageViewModel: Identifiable {
    var id: Int
    var imageUrl: String?
}

struct BannerPageView: View {
    
    let geo: GeometryProxy
    @Binding var models: [BannerPageViewModel]
    
    var body: some View {
        let bannerFrame: CGSize = CGSize(width: geo.size.width - 32, height: (geo.size.width - 32) * 0.58)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(models) { model in
                    if let imageUrl = model.imageUrl {
                        AsyncImage(
                            url: URL(string: imageUrl),
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: bannerFrame.width, height: bannerFrame.height)
                            }, placeholder: {
                                Image(systemName: "photo")
                                    .frame(width: bannerFrame.width, height: bannerFrame.height)
                            }
                        )
                    } else {
                        Image(systemName: "photo")
                            .frame(width: bannerFrame.width, height: bannerFrame.height)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(.horizontal, 16)
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}
struct BannerPageView_Previews: PreviewProvider {
    static var items = HomePreviewMockData.releaseItems
    @State static var models = items.map { BannerPageViewModel(id: $0.id, imageUrl: $0.itemMainImage )}
    static var previews: some View {
        GeometryReader { geo in
            BannerPageView(geo: geo,
                           models: $models)
        }
    }
}
