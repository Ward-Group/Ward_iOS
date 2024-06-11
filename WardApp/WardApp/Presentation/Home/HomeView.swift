//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var output: HomeViewModel.Output
    
    @EnvironmentObject var router: HomeRouter
    
    private let viewModel: HomeViewModel
    private let cancelBag = CancelBag()
    private let loadTrigger = PassthroughSubject<Void, Never>()
        
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let input = HomeViewModel.Input(loadTrigger: loadTrigger.asDriver())
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        loadTrigger.send(())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            naviBarView
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: true, content: {
                    VStack(spacing: 0) {
                        // --- 오늘 마감 --- //
                        HomeHeaderTitleView(title: WardStrings.dueToday, subTitle: WardStrings.enjoyTheLittleLuckYouHaveLeft)
                            .padding([.bottom], 12)
                        BannerPageView(geo: geo, list: output.bannerPageList)
                            .padding([.bottom], 36)
                        // -- 발매 상품 -- //
                        HomeHeaderTitleView(title: WardStrings.releasedProduct, moreButtonAction: {
                            Log.todo("발매 상품 더보기 버튼 액션")
                        })
                        .padding([.bottom], 14)
                        CategoryTabView(list: output.releaseCategoryList)
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

// MARK: - Sub View
extension HomeView {
    private var naviBarView: some View {
        return HStack {
            WardAssets.Image.wardLogo.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(height: 24)
            Spacer()
            Button(action: {
                router.present(fullScreen: .search)
            }, label: {
                WardAssets.Image.Icon.searching.swiftUIImage
                    .resizable()
                    .frame(width: 24, height: 24)
            })
            Spacer()
                .frame(width: 8)
            Button(action: {
                router.present(fullScreen: .notification)
            }, label: {
                WardAssets.Image.Icon.notification.swiftUIImage
                    .resizable()
                    .frame(width: 24, height: 24)
            })
        }
        .padding(.horizontal, 16)
        .background(WardAssets.Color.backgroundColor.swiftUIColor)
        .frame(height: 54)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(HomeRouter())
}
