//
//  HomeAssembler.swift
//  WardApp
//
//  Created by suni on 6/18/24.
//

import SwiftUI

struct HomeAssembler {
    
    @ViewBuilder
    func view() -> some View {
        let viewModel: HomeViewModel = resolve()
        let router: HomeRouter = resolve()
        HomeView(with: viewModel)
            .environmentObject(router)
    }
    
    func resolve() -> HomeViewModel {
        return HomeViewModel()
    }
    
    func resolve() -> HomeRouter {
        return HomeRouter()
    }
}
