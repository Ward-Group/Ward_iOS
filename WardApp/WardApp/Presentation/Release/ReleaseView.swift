//
//  ReleaseView.swift
//  WardApp
//
//  Created by peppermint100 on 7/1/24.
//

import SwiftUI
import Combine

struct ReleaseView: View {
    
    @ObservedObject private var output: ReleaseViewModel.Output
    private let cancelBag = CancelBag()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    
    init(vm: ReleaseViewModel) {
        let input = ReleaseViewModel.Input(
            loadTrigger: loadTrigger.asDriver()
        )
        let output = vm.transform(input, cancelBag: cancelBag)
        self.output = output
    }
    
    var body: some View {
        ZStack {
            Color.background
            
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    InlineNavBarView(
                        title: WardStrings.releaseInfo,
                        buttonsRight: [
                            NavigationBarButton(style: .search, trigger: searchButtonTrigger)
                        ])
                    .padding(.bottom, 15)
                    
                    WardSegementedControl(
                        tabs: output.categories.map { WardSegmentedControlTab(id: $0.rawValue, title: $0.title)},
                        currentTab: $output.categoryTab,
                        font: WardFonts.Pretendard.semiBold.swiftUIFont(size: 16)
                    )
                    .frame(height: 20)
                    
                    WardCircularSegmentedControl(
                        tabs: output.sortOptions.map { WardSegmentedControlTab(id: $0.rawValue, title: $0.title)},
                        currentTab: $output.sortOptionTab)
                    .frame(height: 45)
                    .padding()
                    .fixedSize()
                    
                    VStack {
                        if output.isFetching {
                            ProgressView()
                        } else {
                            switch output.sortOption {
                            case .dueToday, .releaseNow:
                                ScrollView(.vertical) {
                                    LazyVStack {
                                        ForEach(output.releasedItems) { releasedItem in
                                            ReleasedItemListView(geo: geo, item: releasedItem)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .scrollIndicators(.hidden)
                            case .releaseConfirm, .registerToday:
                                ScrollView {
                                    LazyVGrid(columns: columns, spacing: 10) {
                                        ForEach(output.items) { item in
                                            ReleasedItemGridView(geo: geo, item: item)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .scrollIndicators(.hidden)
                            }
                        }
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ReleaseAssembler().view()
}
