//
//  HomeListPageView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI

struct HomeListPageModel: Identifiable {
    let id = UUID()
    var products: [HomeProductHorizontalModel]
}

struct HomeListPageView: View {
    
    let geo: GeometryProxy
    var models: [HomeListPageModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(models, id: \.id) { model in
                    itemList(products: model.products)
                        .frame(width: geo.size.width)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}

extension HomeListPageView {
    private func itemList(products: [HomeProductHorizontalModel]) -> some View {
        LazyVStack(alignment: .center) {
            ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                HomeProductHorizontalView(model: product)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        // TODO: TAB
                    }
                if index < products.count - 1 {
                    Divider()
                        .padding()
                }
            }
        }
    }
}
