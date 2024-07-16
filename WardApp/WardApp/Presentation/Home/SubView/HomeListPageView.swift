//
//  HomeListPageView.swift
//  WardApp
//
//  Created by suni on 6/4/24.
//

import SwiftUI
import Combine

struct HomeListPageViewModel: Identifiable {
    let id = UUID()
    var viewType: ViewType
    var releaseItems: [HomeReleaseItem] = []
    var items: [HomeItem] = []
    
    enum ViewType {
        case release
        case item
    }
}

struct HomeListPageView: View {
    
    let geo: GeometryProxy
    @Binding var model: HomeListPageViewModel
    @State private var currentPage: Int? = 0
    @State private var numberOfPage: Int = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    if model.viewType == .release {
                        let models = stride(from: 0, to: model.releaseItems.count, by: 5).map {
                            return HomeListPageViewModel(
                                viewType: model.viewType,
                                releaseItems: Array(model.releaseItems[$0..<min($0 + 5, model.releaseItems.count)])
                            )
                        }
                        ForEach(models) { model in
                            releaseItemList(items: model.releaseItems)
                                    .frame(width: geo.size.width)
                        }
                    } else {
                        let models = stride(from: 0, to: model.items.count, by: 5).map {
                            return HomeListPageViewModel(
                                viewType: model.viewType,
                                items: Array(model.items[$0..<min($0 + 5, model.items.count)])
                            )
                        }
                        ForEach(models) { model in
                            itemList(items: model.items)
                                    .frame(width: geo.size.width)
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
                    if model.viewType == .release {
                        numberOfPage = model.releaseItems.count / 5
                    } else {
                        numberOfPage = model.items.count / 5
                    }
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
struct HomeListPageView_Previews: PreviewProvider {
    static var items = HomePreviewMockData.items
    static var releaseItems = HomePreviewMockData.releaseItems
    @State static var model = HomeListPageViewModel(viewType: .release, releaseItems: releaseItems)
    static var previews: some View {
        return GeometryReader { geo in
            HomeListPageView(geo: geo,
                             model: $model)
        }
    }
}
