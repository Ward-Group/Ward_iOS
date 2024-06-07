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
    func homeView() -> some View {
        HomeView(viewModel: HomeViewModel())
    }
    
    @ViewBuilder
    func build(_ navi: NaviType) -> some View {
        switch navi {
        case .notification: 
            let view: NotificationView = NotificationAssemblerImpl().resolve()
            view
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
            router.homeView()
                .fullScreenCover(item: $router.presentedFullScreen) { naviType in
                    router.build(naviType)
                }
        }
        .environmentObject(router)
    }
}
