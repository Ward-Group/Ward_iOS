//
//  BrandListView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI
import Combine

struct BrandListView: View {
    
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let currentFilterOptionTrigger = PassthroughSubject<FilterOption, Never>()
    private let isLikedTrigger = PassthroughSubject<BrandListItem, Never>()
    private let backButtonTrigger = PassthroughSubject<Void, Never>()
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    
    @ObservedObject private var input: BrandListViewModel.Input
    @ObservedObject private var output: BrandListViewModel.Output
    private let cancelBag = CancelBag()
    
    init(vm: BrandListViewModel) {
        let input = BrandListViewModel.Input(
            loadTrigger: loadTrigger.asDriver(),
            currentFilterOptionTrigger: currentFilterOptionTrigger.asDriver(),
            isLikedTrigger: isLikedTrigger.asDriver()
        )
        self.input = input
        self.output = vm.transform(input, cancelBag: cancelBag)
        
        loadTrigger.send()
    }
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                InlineNavBarView(
                    title: WardStrings.brand,
                    buttonsRight: [NavigationBarButton(style: .back, trigger: backButtonTrigger)],
                    buttonsLeft: [NavigationBarButton(style: .search, trigger: searchButtonTrigger)]
                )
                HStack {
                    itemCount
                    Spacer()
                    filter
                }
                .padding()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach($output.items, id: \.nameEn) { item in
                            BrandListItemRowView(item: item) {
                                isLikedTrigger.send(item.wrappedValue)
                            }
                        }
                        .frame(minHeight: 180)
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
    }
}

#Preview {
    BrandListView(vm: BrandListViewModel())
}

extension BrandListView {
    private var itemCount: some View {
        VStack {
            Text("\(WardStrings.total) \(output.items.count) \(WardStrings.countingUnitKorean)")
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.black8)
        }
    }
    
    private var filter: some View {
        Menu {
            ForEach(output.filterOptions, id: \.id) { option in
                Button(action: {
                    currentFilterOptionTrigger.send(option)
                }, label: {
                    Text(option.title)
                        .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    
                    if option == output.currentFilterOption {
                        WardAssets.Image.Icon.chevronDown.swiftUIImage
                            .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    }
                })
            }
        } label: {
            Button(action: {
            }, label: {
                Text(output.currentFilterOption.title)
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    .foregroundStyle(Color.black8)
                
                WardAssets.Image.Icon.chevronDown.swiftUIImage
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
            })
        }
    }
}
