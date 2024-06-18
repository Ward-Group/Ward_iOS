//
//  BrandDetailView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI
import Combine

struct BrandDetailView: View {
    
    @ObservedObject private var input: BrandDetailViewModel.Input
    @ObservedObject private var output: BrandDetailViewModel.Output
    
    private let currentFilterOptionTrigger = PassthroughSubject<FilterOption, Never>()
    private let isLikedTrigger = PassthroughSubject<Void, Never>()
    private let backButtonTrigger = PassthroughSubject<Void, Never>()
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: BrandDetailViewModel) {
        let input = BrandDetailViewModel.Input(
            currentFilterOptionTrigger: currentFilterOptionTrigger.asDriver(),
            isLikedTrigger: isLikedTrigger.asDriver()
        )
        self.input = input
        self.output = vm.transform(input, cancelBag: cancelBag)
    }
    
    var body: some View {
        let item = GridItem(.adaptive(minimum: 100), spacing: 10)
        let columns = Array(repeating: item, count: 2)
        
        ZStack {
            Color.background
            GeometryReader { geo in
                let imageSize = geo.size.width * 0.15
                VStack(alignment: .leading) {
                    InlineNavBarView(
                        title: WardStrings.brand,
                        buttonsRight: [NavigationBarButton(style: .back, trigger: backButtonTrigger)],
                        buttonsLeft: [NavigationBarButton(style: .search, trigger: searchButtonTrigger)]
                    )
                    BrandItemHeaderView(item: $output.item, imageSize: imageSize) {
                        isLikedTrigger.send()
                    }
                    .frame(height: imageSize)
                    .padding()
                    
                    Divider()
                    
                    WardSegementedControl(
                        tabs: output.tabs, currentTab: $output.currentTab,
                        active: Color.black0, inactive: Color.darkGray,
                        font: WardFonts.Pretendard.semiBold.swiftUIFont(size: 16)
                    )
                    .frame(width: geo.size.width * 0.5, height: 45)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    
                    HStack {
                        if output.currentTab.isEqual(to: "item") {
                            itemCount
                        } else {
                            releseInfoListCount
                        }
                        
                        Spacer()
                        
                        filter
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    ScrollView {
                        if output.currentTab.isEqual(to: "item") {
                            LazyVGrid(columns: columns, spacing: 25) {
                                ForEach(output.items) { item in
                                    BrandDetailGridItemView(geo: geo, item: item)
                                }
                            }
                        } else {
                            LazyVStack(spacing: 15) {
                                ForEach(output.releaseInfoList) { item in
                                    ReleaseListItemView(geo: geo, item: item)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    BrandDetailView(vm: BrandDetailViewModel())
}

extension BrandDetailView {
    
    private var releseInfoListCount: some View {
        VStack {
            Text("\(WardStrings.releaseInfo) \(output.releaseInfoList.count) \(WardStrings.countingUnitKorean)")
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.black8)
        }
    }
    
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
