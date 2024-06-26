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
        return HomeViewModel(releaseUseCase: resolve())
    }
    
    func resolve() -> HomeRouter {
        return HomeRouter()
    }
    
    func resolve() -> ReleaseUseCase {
        return ReleaseUseCase(repository: resolve())
    }
    
    func resolve() -> ReleaseRepository {
        return ReleaseRepository()
    }
}
