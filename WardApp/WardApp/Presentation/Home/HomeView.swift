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
    
    private let viewModel: HomeViewModel
    private let cancelBag = CancelBag()
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let notificationButtonTrigger = PassthroughSubject<Void, Never>()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let input = HomeViewModel.Input(
            loadTrigger: loadTrigger.asDriver(),
            notificationButtonTrigger: notificationButtonTrigger.asDriver()
        )
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        loadTrigger.send(())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderNavBarView()
                .overlay(alignment: .trailing) {
                    HStack {
                        searchButton
                        notificationButton
                    }
                    .padding(.trailing)
                }
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: true, content: {
                    LazyVStack(spacing: 0) {
                        // --- 오늘 마감 --- //
                        HomeHeaderView(title: WardStrings.dueToday, subTitle: WardStrings.enjoyTheLittleLuckYouHaveLeft)
                            .padding([.bottom], 12)
                        BannerPageView(geo: geo, list: output.bannerPageList)
                            .padding([.bottom], 36)
                        // -- 발매 상품 -- //
                        HomeHeaderView(title: WardStrings.releasedProduct, moreButtonAction: {
                            Log.todo("발매 상품 더보기 버튼 액션")
                        })
                        .padding([.bottom], 14)
                        CategoryTabView(list: output.releaseCategoryList)
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .fullScreenCover(isPresented: $output.showNotificationSheet) {
            NotificationView(vm: NotificationAssemblerImpl().resolve())
        }
    }
}

extension HomeView {
    
    private var searchButton: some View {
        Button(action: {}, label: {
            WardAssets.Image.Icon.searching.swiftUIImage
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
    
    private var notificationButton: some View {
        Button(action: {
            notificationButtonTrigger.send()
        }, label: {
            WardAssets.Image.Icon.notification.swiftUIImage
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
