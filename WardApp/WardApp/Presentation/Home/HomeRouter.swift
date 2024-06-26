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
