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
        
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let input = HomeViewModel.Input(loadTrigger: loadTrigger.asDriver())
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        loadTrigger.send(())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderNavBarView(showSearching: true, showNotification: true)
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: true, content: {
                    LazyVStack(spacing: 0) {
                        // --- 오늘 마감 --- //
                        HomeHeaderView(title: WardStrings.dueToday, subTitle: WardStrings.enjoyTheLittleLuckYouHaveLeft)
                            .padding([.bottom], 12)
                        // TODO: 배너 이미지 API 연결
                        BannerPageView(geo: geo, list: [.init(), .init(), .init(), .init(), .init()])
                            .padding([.bottom], 36)
                        // -- 발매 상품 -- //
                        HomeHeaderView(title: WardStrings.releasedProduct, moreButtonAction: {
                            Log.todo("발매 상품 더보기 버튼 액션")
                        })
                        .padding([.bottom], 14)
                        // TODO: 카테고리 API 연결
                        CategoryTabView(list: [CategoryTabViewModel(title: "오늘 마감", isSelect: true),
                                               CategoryTabViewModel(title: "발매 중", isSelect: false),
                                               CategoryTabViewModel(title: "관심 상품", isSelect: false),
                                               CategoryTabViewModel(title: "발매 확장", isSelect: false),
                                               CategoryTabViewModel(title: "오늘 등록", isSelect: false)])
                    }
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
