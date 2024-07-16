//
//  AppTabView.swift
//  WardApp
//
//  Created by peppermint100 on 6/1/24.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @EnvironmentObject private var router: MainRouter
    @ObservedObject private var input: MainViewModel.Input
    @ObservedObject private var output: MainViewModel.Output
    
    private let loadTrigger = PassthroughSubject<Void, Never>()
    private let cancelBag = CancelBag()
    
    init(vm: MainViewModel) {
        let input = MainViewModel.Input(
            loadTrigger: loadTrigger.eraseToAnyPublisher()
        )
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
        
        UITabBar.appearance().backgroundColor = UIColor(Color.background)
        
        loadTrigger.send(())
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(AppTab.allCases) { tab in
                tab.destination
                    .tabItem {
                        Text(tab.title)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                        tab.icon
                            .renderingMode(.template)
                    }
                    .tag(tab)
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
