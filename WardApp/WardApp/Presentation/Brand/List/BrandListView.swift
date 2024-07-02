//
//  BrandListView.swift
//  WardApp
//
//  Created by peppermint100 on 6/14/24.
//

import SwiftUI
import Combine

struct BrandListView: View {
    
    var router: BrandRouterType
    
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let currentFilterOptionTrigger = PassthroughSubject<BrandFilterOption, Never>()
    private let backButtonTrigger = PassthroughSubject<Void, Never>()
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    private let loadMoreBrandsTrigger = PassthroughSubject<Int, Never>()
    
    @ObservedObject private var input: BrandListViewModel.Input
    @ObservedObject private var output: BrandListViewModel.Output
    private let cancelBag = CancelBag()
    
    init(vm: BrandListViewModel, router: BrandRouterType) {
        let input = BrandListViewModel.Input(
            loadTrigger: loadTrigger.asDriver(),
            currentFilterOptionTrigger: currentFilterOptionTrigger.asDriver(),
            loadMoreBrandsTrigger: loadMoreBrandsTrigger.asDriver()
        )
        self.input = input
        self.output = vm.transform(input, cancelBag: cancelBag)
        self.router = router
        
        loadTrigger.send()
    }
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                InlineNavBarView(
                    title: WardStrings.brand,
                    buttonsLeft: [NavigationBarButton(style: .back, trigger: backButtonTrigger)],
                    buttonsRight: [NavigationBarButton(style: .search, trigger: searchButtonTrigger)]
                )
                HStack {
                    itemCount
                    Spacer()
                    filter
                }
                .padding()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(0..<output.brands.count, id: \.self) { idx in
                            let brand = $output.brands[idx]
                            BrandListItemRowView(brand: brand)
                                .onTapGesture {
                                    router.pushToDetail(brand: brand.wrappedValue)
                                }
                                .onAppear {
                                    loadMoreBrandsTrigger.send(idx + 1)
                                }
                        }
                        .frame(minHeight: 180)
                    }
                    
                    if output.isLoadingMoreBrands {
                        ProgressView()
                            .padding()
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    BrandAssembler().view(router: CategoryRouter())
}

extension BrandListView {
    private var itemCount: some View {
        VStack {
            Text("\(WardStrings.total) \(output.pageInfo.totalElements) \(WardStrings.countingUnitKorean)")
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
                    Text(option.filterOption.title)
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
                Text(output.currentFilterOption.filterOption.title)
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    .foregroundStyle(Color.black8)
                
                WardAssets.Image.Icon.chevronDown.swiftUIImage
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
            })
        }
    }
}
