//
//  HomeListPageView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI

struct HomeListPageViewModel: Identifiable {
    let id = UUID()
    var releaseItems: [HomeReleaseItem] = []
    var items: [HomeItem] = []
}

struct HomeListPageView: View {
    
    let geo: GeometryProxy
    @State private var currentPage: Int? = 0
    @State private var numberOfPage: Int = 0
    @Binding var models: [HomeListPageViewModel]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(Array(models.enumerated()), id: \.element.id) { index, model in
                        if !model.releaseItems.isEmpty {
                            releaseItemList(items: model.releaseItems)
                                .frame(width: geo.size.width)
                                .id(index)
                        } else if !model.items.isEmpty {
                            
                        }
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
    private func releaseItemList(items: [HomeReleaseItem]) -> some View {
        LazyVStack(alignment: .center) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                ReleaseItemHorizontalView(model: item)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        // TODO: TAB
                    }
                if index < items.count - 1 {
                    Divider()
                        .padding()
                }
            }
        }
    }
    
    private func itemList(items: [HomeItem]) -> some View {
        LazyVStack(alignment: .center) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                ItemHorizontalView(rank: "\(index+1)", model: item)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        // TODO: TAB
                    }
                if index < items.count - 1 {
                    Divider()
                        .padding()
                }
            }
        }
    }
}
