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
    @State private var currentPage: Int? = 0
    @State private var numberOfPage: Int = 0
    @Binding var models: [HomeListPageModel]
    
    var body: some View {
        VStack() {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(Array(models.enumerated()), id: \.element.id) { index, model in
                        itemList(products: model.products)
                            .frame(width: geo.size.width)
                            .id(index)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .scrollPosition(id: $currentPage)
            .padding(.bottom, 20)
            PageControl(numberOfPage: $numberOfPage, currentPage: $currentPage)
                .frame(height: 6)
                .onAppear {
                    numberOfPage = models.count
                }
        }
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
