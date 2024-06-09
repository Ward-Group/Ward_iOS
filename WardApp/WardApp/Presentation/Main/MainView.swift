//
//  AppTabView.swift
//  WardApp
//
//  Created by peppermint100 on 6/1/24.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject private var router: MainRouter
    @ObservedObject private var input: MainViewModel.Input
    @ObservedObject private var output: MainViewModel.Output
    
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let cancelBag = CancelBag()
    
    init(vm: MainViewModel, router: MainRouter) {
        let input = MainViewModel.Input(
            loadTrigger: loadTrigger.eraseToAnyPublisher()
        )
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
        self.router = router
        
        loadTrigger.send(())
    }
    
    var body: some View {
        TabView(selection: $output.selectedTab) {
            ForEach(AppTab.allCases) { tab in
                tab.destination
                    .tabItem {
                        Text(tab.item.label)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                        tab.item.icon
                            .renderingMode(.template)
                    }
                    .tag(tab.id)
            }
        }
        .tint(Color.mainBlue)
        .fullScreenCover(item: $router.fullScreenSheet) { sheet in
            router.build(fullScreenSheet: sheet)
        }
    }
}

#Preview {
    MainViewAssembler().view()
}
