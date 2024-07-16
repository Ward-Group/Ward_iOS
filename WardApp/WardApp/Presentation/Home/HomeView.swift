//
//  HomeView.swift
//  WardApp
//
//  Created by suni on 5/19/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @EnvironmentObject var router: HomeRouter
    @ObservedObject var output: HomeViewModel.Output
    
    private let cancelBag = CancelBag()
    
    // Input Trigger
    private let loadTrigger = PassthroughSubject<Void, Never>()
    
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    private let notificationButtonTrigger = PassthroughSubject<Void, Never>()
    
    init(with viewModel: HomeViewModel) {
        let input = HomeViewModel.Input(
            loadTrigger: loadTrigger.asDriver()
        )
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        loadTrigger.send(())
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 0) {
                LogoNavBarView(buttonsRight: [
                    NavigationBarButton(style: .search, trigger: searchButtonTrigger),
                    NavigationBarButton(style: .notification, trigger: notificationButtonTrigger)
                ])
                .padding(.bottom, 10)
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: true, content: {
                        VStack(spacing: 0) {
                            // --- 오늘 마감 --- //
                            if $output.bannerPages.count > 0 {
                                HomeHeaderTitleView(title: WardStrings.dueToday, subTitle: WardStrings.enjoyTheLittleLuckYouHaveLeft)
                                    .padding(.bottom, 12)
                                BannerPageView(geo: geo, models: $output.bannerPages)
                                    .padding(.bottom, 36)
                            }
                            // -- 발매 상품 -- //
                            HomeHeaderTitleView(title: WardStrings.releasedProduct, moreButtonAction: {
                                Log.todo("발매 상품 더보기 버튼 액션")
                            })
                            .padding(.bottom, 14)
                            SectionTabView(models: $output.releaseSectionTabs,
                                           selectedModel: $output.selectedReleaseSectionTab)
                            .padding(.bottom, 20)
                            HomeListPageView(geo: geo, model: $output.releaseListPage)
                                .padding(.bottom, 50)
                        }
                    })
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .fullScreenCover(item: $router.presentedFullScreen) { naviType in
                router.build(naviType)
            }
        }
        .onReceive(searchButtonTrigger, perform: { _ in
            router.present(fullScreen: .search)
        })
        .onReceive(notificationButtonTrigger, perform: { _ in
            router.present(fullScreen: .notification)
        })
    }
}

#Preview {
    HomeAssembler().view()
}
