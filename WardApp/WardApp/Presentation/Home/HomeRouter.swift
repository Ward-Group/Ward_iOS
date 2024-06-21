//
//  HomeRouter.swift
//  WardApp
//
//  Created by suni on 6/3/24.
//

import Foundation
import SwiftUI

class HomeRouter: ObservableObject {
    // MARK: - enum
    enum NaviType: String, Identifiable {
        case notification
        case search
        
        var id: String {
            self.rawValue
        }
    }
    
    // MARK: - Published vars
    @Published var path = NavigationPath()
    @Published var presentedFullScreen: NaviType?
        
    // MARK: - Initialization
    init() {
        Log.debug("init:\(#file)")
    }
    
    deinit {
        Log.debug("deinit:\(#file)")
    }
    
    // MARK: - ViewBuilder
    @ViewBuilder
    func build(_ navi: NaviType) -> some View {
        switch navi {
        case .notification: 
            NotificationAssembler().view()
        case .search:
            SearchViewAssembler().view()
        }
    }

    // MARK: - func
    func present(fullScreen: NaviType) {
        self.presentedFullScreen = fullScreen
    }
}

struct HomeRouterView: View {
    @StateObject private var router: HomeRouter = HomeRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            // TODO: Notification, Search 안나옴 이부분 HomeView(with: HomeViewModel())로 하면 나옴 RouterView, Router 의존관계 문제로 보임
            HomeAssembler().view()
                .fullScreenCover(item: $router.presentedFullScreen) { naviType in
                    router.build(naviType)
                }
        }
        .environmentObject(router)
    }
}
